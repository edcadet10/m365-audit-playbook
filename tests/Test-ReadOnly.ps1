#requires -Version 7.2
<#
.SYNOPSIS
Test the audit collectors' read-only and evidence-completeness boundaries offline.
.DESCRIPTION
Runs synthetic success and falsifying cases using mocked transports. Writes a local
test report; never connects to Microsoft 365. Microsoft references describe the
interfaces being simulated, not certification of this custom test suite.
.LINK
https://learn.microsoft.com/en-us/graph/paging
.LINK
https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps
#>
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$testRoot=Join-Path ([System.IO.Path]::GetTempPath()) ('m365-audit-tests-'+[guid]::NewGuid().ToString('N'))
$null=New-Item -ItemType Directory -Path $testRoot
$results=[System.Collections.Generic.List[object]]::new()
function Test-Case([string]$Name,[scriptblock]$Body) {
    try { & $Body; $results.Add(@{name=$Name;passed=$true}) }
    catch { $results.Add(@{name=$Name;passed=$false;error=$_.Exception.Message}) }
}
function Assert-True($Condition,[string]$Message) { if (-not $Condition) {throw $Message} }
$module=Import-Module (Join-Path $root 'scripts/M365Audit.psm1') -Force -PassThru
$tenant=[guid]'11111111-1111-1111-1111-111111111111'
Test-Case 'Every generated PowerShell file parses' {
    $bad=@(); $files=Get-ChildItem -LiteralPath (Join-Path $root 'scripts') -Recurse -File | Where-Object {$_.Extension -in @('.ps1','.psm1')}
    foreach($f in $files) {
        $tokens=$null; $errors=$null
        $null=[System.Management.Automation.Language.Parser]::ParseFile($f.FullName,[ref]$tokens,[ref]$errors)
        $bad+=@($errors)
    }
    Assert-True ($bad.Count -eq 0) ($bad | Out-String)
}
Test-Case 'Every recipe has script, evidence fields and Microsoft references' {
    $recipes=Get-Content (Join-Path $root 'scripts/recipes.json') -Raw | ConvertFrom-Json -AsHashtable
    Assert-True ($recipes.Count -eq 151) 'Expected 90 controls, 48 fieldwork steps and 13 phases'
    foreach($r in $recipes.Values) {
        $folder=if($r.type -eq 'control') {'controls'} else {'steps'}
        Assert-True (Test-Path (Join-Path $root "scripts/$folder/$($r.id).ps1")) "Missing script $($r.id)"
        Assert-True ($r.requiredFields.Count -gt 0 -and $r.sources.Count -gt 0) "Incomplete contract $($r.id)"
        $text=Get-Content (Join-Path $root "scripts/$folder/$($r.id).ps1") -Raw
        Assert-True ($text.Contains('.SYNOPSIS') -and $text.Contains('.DESCRIPTION') -and $text.Contains('.LINK') -and $text.Contains('https://learn.microsoft.com/')) "Missing script help/source $($r.id)"
    }
}
Test-Case 'Plan does not require session or write output' {
    $plan=& (Join-Path $root 'scripts/controls/IAM-03.ps1') -Plan
    Assert-True ($plan.mode -eq 'Plan' -and -not $plan.tenantAccessed -and $plan.operations.Count -ge 5) 'Invalid plan'
}
# All transport replacements are private to this imported module's test session.
# Production code exposes no mock parameter and no user-provided script blocks.
& $module {
    $script:TestPages=@(); $script:TestIndex=0; $script:TestCalls=0
    function script:Invoke-AuditGraphGet([string]$Uri) {
        $script:TestCalls++
        $next=$script:TestPages[$script:TestIndex]; $script:TestIndex++
        if($next -is [string]) {throw $next}
        return $next
    }
}
function Read-MockPages($Pages,[int]$Cap=10) {
    $dir=Join-Path $testRoot ([guid]::NewGuid().ToString('N')); $null=New-Item -ItemType Directory -Path $dir
    & $module {param($p,$d,$cap) $script:TestPages=$p; $script:TestIndex=0; $script:TestCalls=0; Read-AuditGraphPages 'https://graph.microsoft.com/v1.0/users' 'Global' 'collection' $cap $d} $Pages $dir $Cap
}
Test-Case 'Two Graph pages retain all records and report collected' {
    $r=Read-MockPages @(@{value=@(@{id='1'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users?$skiptoken=x'},@{value=@(@{id='2'})})
    Assert-True ($r.status -eq 'Collected' -and $r.count -eq 2 -and $r.pages -eq 2) 'Pagination failed'
}
Test-Case '403 cannot be mistaken for an empty successful export' {
    $r=Read-MockPages @('HTTP 403 forbidden')
    Assert-True ($r.status -eq 'Failed' -and $r.count -eq 0) '403 falsely collected'
}
Test-Case 'Later page error preserves evidence and reports partial' {
    $r=Read-MockPages @(@{value=@(@{id='1'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users?$skiptoken=x'},'HTTP 429 throttled')
    Assert-True ($r.status -eq 'Partial' -and $r.count -eq 1 -and $r.pages -eq 1) 'Interrupted export lost evidence or falsely completed'
}
Test-Case 'External nextLink is rejected before second request' {
    $r=Read-MockPages @(@{value=@(@{id='1'});'@odata.nextLink'='https://attacker.example/v1.0/users'})
    $calls=& $module {$script:TestCalls}
    Assert-True ($r.status -eq 'Partial' -and $calls -eq 1) 'Unsafe URL reached transport'
}
Test-Case 'Pagination cap reports partial' {
    $r=Read-MockPages @(@{value=@(@{id='1'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users?$skiptoken=x'}) 1
    Assert-True ($r.status -eq 'Partial') 'Cap falsely collected'
}
Test-Case 'Repeated pagination URL is rejected' {
    $r=Read-MockPages @(@{value=@(@{id='1'});'@odata.nextLink'='https://graph.microsoft.com/v1.0/users'})
    Assert-True ($r.status -eq 'Partial') 'Repeated link not rejected'
}
Test-Case 'Malformed collection body is rejected' {
    $r=Read-MockPages @(@{unexpected='not an empty collection'})
    Assert-True ($r.status -eq 'Failed') 'Missing value treated as success'
}
Test-Case 'Wrong tenant and cloud fail before Graph transport' {
    foreach($context in @(@{TenantId='22222222-2222-2222-2222-222222222222';Environment='Global'},@{TenantId=$tenant.ToString();Environment='China'})) {
        $rejected=$false
        try { & $module {param($c,$t) Assert-AuditContext $c $t 'Global'} $context $tenant } catch {$rejected=$true}
        Assert-True $rejected 'Context mismatch accepted'
    }
}
Test-Case 'Unsupported remote command cannot execute' {
    $rejected=$false
    try { & $module { Invoke-AuditExchangeRead 'Set-Mailbox' @{} $null } } catch {$rejected=$_.Exception.Message -match 'allowlisted'}
    Assert-True $rejected 'Forbidden command accepted'
}
Test-Case 'Unsafe Graph schemes, ports and versions are rejected' {
    foreach($uri in @('http://graph.microsoft.com/v1.0/users','https://graph.microsoft.com:444/v1.0/users','https://graph.microsoft.com/beta/users','https://user@graph.microsoft.com/v1.0/users')) {
        $rejected=$false
        try { & $module {param($u) Assert-AuditUri $u 'Global'} $uri } catch {$rejected=$true}
        Assert-True $rejected "Unsafe URL accepted: $uri"
    }
}
Test-Case 'Workload pagination cannot change host or operation path' {
    foreach($uri in @('https://attacker.example/v1/admin/tenantsettings','https://api.fabric.microsoft.com/v1/admin/other','http://api.fabric.microsoft.com/v1/admin/tenantsettings')) {
        $rejected=$false
        try { & $module {param($u) Assert-AuditRestUri $u 'api.fabric.microsoft.com' '/v1/admin/tenantsettings'} $uri } catch {$rejected=$true}
        Assert-True $rejected 'Unsafe workload URL accepted'
    }
}
Test-Case 'REST continuation token collects both public-embed pages without following returned URI' {
    $dir=Join-Path $testRoot 'rest'; $null=New-Item -ItemType Directory -Path $dir
    $r=& $module {
        param($t,$d)
        function script:Get-AuditRestToken {return (ConvertTo-SecureString 'synthetic-no-network-token' -AsPlainText -Force)}
        $script:RestCalls=@()
        function script:Invoke-AuditRestGet([string]$Uri,[securestring]$Token) {
            $script:RestCalls+=@($Uri)
            if($script:RestCalls.Count -eq 1) {return @{artifactAccessEntities=@(@{artifactId='one'});continuationToken='next/token';continuationUri='https://attacker.example'}}
            return @{artifactAccessEntities=@(@{artifactId='two'})}
        }
        Read-AuditRest $script:Operations['publicEmbeds'] $script:Operations['publicEmbeds'].path $t 'Global' 5 $d
    } $tenant $dir
    $uris=@(& $module {$script:RestCalls})
    Assert-True ($r.status -eq 'Collected' -and $r.count -eq 2 -and $uris[1] -eq 'https://api.powerbi.com/v1.0/myorg/admin/widelySharedArtifacts/publishedToWeb?continuationToken=next%2Ftoken') 'REST pagination lost records or trusted returned URI'
}
Test-Case 'UAL duplicate records cannot produce a successful export' {
    $dir=Join-Path $testRoot 'ual'; $null=New-Item -ItemType Directory -Path $dir
    $r=& $module {
        param($t,$d)
        function script:Get-AuditExchangeConnection {return @{TenantId='11111111-1111-1111-1111-111111111111'}}
        function script:Invoke-AuditExchangeRead {return @(@{Identity='duplicate';ResultCount=2},@{Identity='duplicate';ResultCount=2})}
        Read-AuditExchange $script:Operations['ual'] @{} $t 10 $d
    } $tenant $dir
    Assert-True ($r.status -eq 'Partial' -and $r.count -eq 1) 'UAL duplicate was silently counted'
}
Test-Case 'Missing local evidence is incomplete' {
    $r=& $module {param($p,$t) Read-AuditLocalEvidence $script:Recipes['REC-02'] $p $t} $testRoot $tenant
    Assert-True ($r.status -eq 'Incomplete' -and $r.gaps.Count) 'Missing package falsely complete'
}
Test-Case 'Local evidence traversal is rejected' {
    $rejected=$false
    try { & $module {param($p) Resolve-AuditEvidencePath $p '../outside.json'} $testRoot } catch {$rejected=$true}
    Assert-True $rejected 'Path escaped evidence root'
}
Test-Case 'Existing recovery record is hashed and RTO breach measured' {
    $file=Join-Path $testRoot 'restore-log.txt'; 'Synthetic test receipt, not tenant evidence' | Set-Content $file
    $record=@{id='test';owner='Synthetic owner';observedUtc='2026-01-02T02:00:00Z';evidenceFiles=@('restore-log.txt');startedUtc='2026-01-02T00:00:00Z';acceptedUtc='2026-01-02T02:00:00Z';recoveryPointUtc='2026-01-01T22:00:00Z';incidentUtc='2026-01-02T00:00:00Z';rtoSeconds=3600;rpoSeconds=10800;integrityChecks='Synthetic comparison';businessAcceptance='Synthetic receipt'}
    @{id='REC-02';tenantId=$tenant.ToString();records=@($record)} | ConvertTo-Json -Depth 10 | Set-Content (Join-Path $testRoot 'REC-02.json')
    $r=& $module {param($p,$t) Read-AuditLocalEvidence $script:Recipes['REC-02'] $p $t} $testRoot $tenant
    Assert-True ($r.status -eq 'EvidencePresent' -and $r.hashes.Count -eq 2) 'Valid package rejected'
    $f=@(& $module {param($l) Get-AuditCandidates $script:Recipes['REC-02'] @{} $l} $r)
    Assert-True ($f.Count -eq 1 -and $f[0].durationSeconds -eq 7200 -and $f[0].exceedsRto -and -not $f[0].exceedsRpo) 'Recovery breach not identified'
}
Test-Case 'End-to-end offline execution never reports live reads collected or controls passed' {
    $run=& (Join-Path $root 'scripts/Invoke-M365Audit.ps1') -Id AllControls -ExpectedTenantId $tenant -OutputRoot $testRoot -InputRoot $testRoot -Mode Offline
    $report=Get-Content (Join-Path $run.outputDirectory 'report.json') -Raw | ConvertFrom-Json -AsHashtable
    Assert-True ($report.assessments.Count -eq 90 -and $run.incomplete -eq 90) 'Expected all controls to disclose missing live evidence'
    Assert-True (@($report.operationSummary | Where-Object {$_.status -eq 'Collected'}).Count -eq 0) 'Offline run claimed collected live evidence'
    Assert-True (@($report.assessments | Where-Object {$_.controlResult -ne 'Not assessed'}).Count -eq 0) 'Runner asserted a tenant control result'
    Assert-True (Test-Path (Join-Path $run.outputDirectory 'manifest.json')) 'Manifest missing'
}
Test-Case 'Public repository cannot be used as evidence output' {
    $rejected=$false
    try { & (Join-Path $root 'scripts/Invoke-M365Audit.ps1') -Id GOV-01 -ExpectedTenantId $tenant -OutputRoot (Join-Path $root 'evidence') -Mode Offline } catch {$rejected=$_.Exception.Message -match 'outside this public repository'}
    Assert-True $rejected 'Evidence could be written into public repository'
}
Test-Case 'Blank local template fails evidence review and existing template cannot be overwritten' {
    $dir=Join-Path $testRoot 'templates'
    $null=& (Join-Path $root 'scripts/New-EvidenceTemplate.ps1') -Id GOV-02 -ExpectedTenantId $tenant -InputRoot $dir
    $r=& $module {param($p,$t) Read-AuditLocalEvidence $script:Recipes['GOV-02'] $p $t} $dir $tenant
    Assert-True ($r.status -eq 'Incomplete') 'Blank template was accepted'
    $rejected=$false
    try {$null=& (Join-Path $root 'scripts/New-EvidenceTemplate.ps1') -Id GOV-02 -ExpectedTenantId $tenant -InputRoot $dir} catch {$rejected=$true}
    Assert-True $rejected 'Existing workpaper overwritten'
}
Test-Case 'Setup checks, installs, imports, authenticates and verifies in order' {
    $events=@(& $module {
        param($t)
        $script:SetupEvents=[System.Collections.Generic.List[string]]::new(); $script:ModulePresent=$false; $script:SetupContext=$null
        function script:Get-AuditAvailableModule { $script:SetupEvents.Add('check-module'); if($script:ModulePresent){return [pscustomobject]@{Name='Microsoft.Graph.Authentication';Version=[version]'2.39.0';Path='synthetic'}} }
        function script:Install-AuditRequiredModule {$script:SetupEvents.Add('install-module');$script:ModulePresent=$true}
        function script:Import-AuditRequiredModule {$script:SetupEvents.Add('import-module')}
        function script:Get-AuditSetupGraphContext {$script:SetupEvents.Add('check-context');return $script:SetupContext}
        function script:Connect-AuditGraphSession {param($p) $script:SetupEvents.Add('authenticate');$script:SetupContext=[pscustomobject]@{TenantId=$p.TenantId;Environment=$p.Environment;AuthType='Delegated';Scopes=@('Policy.Read.All')}}
        $null=Initialize-AuditSessions @($script:Operations['ca']) $t 'Global' $false '' ''
        $script:SetupEvents.ToArray()
    } $tenant)
    Assert-True (($events -join ',') -eq 'check-module,install-module,check-module,import-module,check-context,authenticate,check-context') ('Unexpected order: '+($events -join ','))
}
Test-Case 'Existing-session mode never installs a missing module or authenticates' {
    $r=& $module {
        param($t)
        $script:ModulePresent=$false; $script:SetupEvents.Clear(); $rejected=$false
        try {$null=Initialize-AuditSessions @($script:Operations['ca']) $t 'Global' $true '' ''} catch {$rejected=$true}
        @{rejected=$rejected;events=@($script:SetupEvents.ToArray())}
    } $tenant
    Assert-True ($r.rejected -and 'install-module' -notin $r.events -and 'authenticate' -notin $r.events) 'Existing-session mode changed local setup or authenticated'
}
Test-Case 'Setup failure stops the runner before any audit transport' {
    $r=& $module {
        param($t,$p)
        function script:Initialize-AuditSessions {throw 'Synthetic authentication failure'}
        $script:ForbiddenCalls=0
        function script:Invoke-AuditGraphGet {$script:ForbiddenCalls++;throw 'Unexpected query'}
        $rejected=$false
        try {$null=Invoke-M365Audit -Id GOV-01 -ExpectedTenantId $t -OutputRoot $p} catch {$rejected=$true}
        @{rejected=$rejected;calls=$script:ForbiddenCalls}
    } $tenant $testRoot
    Assert-True ($r.rejected -and $r.calls -eq 0) 'Audit read occurred after setup failure'
}
$report=@{checkedUtc=[datetimeoffset]::UtcNow.ToString('o');tests=$results.ToArray();passed=@($results | Where-Object {$_.passed}).Count;failed=@($results | Where-Object {-not $_.passed}).Count;liveTenantTested=$false;moduleInstallationTested='Mocked only; no packages installed during authoring';authenticationTested='Mocked only; no tenant sign-in';testArtifactsRetainedLocally=$true}
$report | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $root 'research/script-test-results.json') -Encoding utf8
$results | ForEach-Object {[pscustomobject]$_} | Format-Table name,passed,error -Wrap
Write-Output "Passed: $($report.passed); Failed: $($report.failed)"
if($report.failed) {exit 1}
