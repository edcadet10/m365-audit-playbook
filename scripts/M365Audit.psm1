#requires -Version 7.4
<#
.SYNOPSIS
Microsoft 365 read-only audit evidence engine.
.DESCRIPTION
Collects documented reads, preserves pages and hashes, validates existing
workpapers, and identifies review candidates without changing tenant resources.
Individual operation titles, descriptions, scopes and Microsoft links are in
operations.json and ../docs/SCRIPT-OPERATIONS.md. This is consultant-authored code.
.LINK
https://learn.microsoft.com/en-us/graph/paging
.LINK
https://learn.microsoft.com/en-us/graph/permissions-overview
.LINK
https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps
.LINK
https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azaccesstoken
#>
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:GraphHosts = @{ Global='graph.microsoft.com'; USGov='graph.microsoft.us'; USGovDoD='dod-graph.microsoft.us'; China='microsoftgraph.chinacloudapi.cn' }
$script:Operations = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'operations.json') -Raw | ConvertFrom-Json -AsHashtable
$script:Recipes = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'recipes.json') -Raw | ConvertFrom-Json -AsHashtable
. (Join-Path $PSScriptRoot 'SessionSetup.ps1')
# Only these remote commands can reach the dispatcher, independent of recipe files.
$script:ExchangeAllowlist = @(
 'Get-OrganizationConfig','Get-AdminAuditLogConfig','Get-TransportConfig','Get-DkimSigningConfig',
 'Get-AcceptedDomain','Get-RemoteDomain','Get-InboundConnector','Get-OutboundConnector','Get-TransportRule',
 'Get-AntiPhishPolicy','Get-AntiPhishRule','Get-HostedContentFilterPolicy','Get-HostedContentFilterRule',
 'Get-HostedOutboundSpamFilterPolicy','Get-HostedOutboundSpamFilterRule','Get-MalwareFilterPolicy','Get-MalwareFilterRule',
 'Get-SafeLinksPolicy','Get-SafeLinksRule','Get-SafeAttachmentPolicy','Get-SafeAttachmentRule',
 'Get-EOPProtectionPolicyRule','Get-ATPProtectionPolicyRule','Get-QuarantinePolicy','Get-AuthenticationPolicy',
 'Get-Mailbox','Get-CASMailbox','Get-InboxRule','Get-MailboxPermission','Get-RecipientPermission','Search-UnifiedAuditLog',
 'Get-Label','Get-LabelPolicy','Get-DlpCompliancePolicy','Get-DlpComplianceRule','Get-RetentionCompliancePolicy',
 'Get-RetentionComplianceRule','Get-ComplianceTag','Get-ComplianceCase','Get-UnifiedAuditLogRetentionPolicy'
)
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Write local JSON evidence
.DESCRIPTION
Serializes evidence to a local file with explicit depth.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json
#>
# END GENERATED FUNCTION HELP
function Write-AuditJson($Value, [string]$Path) {
    ConvertTo-Json -InputObject $Value -Depth 80 | Set-Content -LiteralPath $Path -Encoding utf8
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Read Graph session context
.DESCRIPTION
Reads the currently authenticated tenant and cloud.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/get-mgcontext
#>
# END GENERATED FUNCTION HELP
function Get-AuditGraphContext {
    Microsoft.Graph.Authentication\Get-MgContext
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Send an authorized Graph GET
.DESCRIPTION
Uses the Graph SDK transport with the HTTP method fixed to GET.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/invoke-mggraphrequest
#>
# END GENERATED FUNCTION HELP
function Invoke-AuditGraphGet([string]$Uri) {
    Microsoft.Graph.Authentication\Invoke-MgGraphRequest -Method GET -Uri $Uri -OutputType HashTable -ErrorAction Stop
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Assert  Audit Context
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Assert-AuditContext($Context, [guid]$Tenant, [string]$Environment) {
    if (-not $Context -or [string]$Context.TenantId -ne $Tenant.ToString() -or [string]$Context.Environment -ne $Environment) {
        throw 'Graph context is absent or does not match the expected tenant and cloud. No query was issued.'
    }
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Assert  Audit Uri
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Assert-AuditUri([string]$Uri, [string]$Environment) {
    $u = [uri]$Uri
    if (-not $u.IsAbsoluteUri -or $u.Scheme -ne 'https' -or $u.Host -ne $script:GraphHosts[$Environment] -or $u.Port -ne 443 -or $u.UserInfo -or $u.Fragment -or -not $u.AbsolutePath.StartsWith('/v1.0/')) {
        throw 'Rejected Graph URL: HTTPS, the selected cloud host, port 443 and /v1.0/ are required.'
    }
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Collect Graph pages
.DESCRIPTION
Retains pages and marks interrupted or unsafe pagination incomplete.
.LINK
https://learn.microsoft.com/en-us/graph/paging
#>
# END GENERATED FUNCTION HELP
function Read-AuditGraphPages([string]$Uri, [string]$Environment, [string]$Shape, [int]$MaxPages, [string]$Directory) {
    $items = [System.Collections.Generic.List[object]]::new()
    $seen = [System.Collections.Generic.HashSet[string]]::new()
    $pages=0; $status='Collected'; $errorText=$null
    try {
        while ($Uri) {
            Assert-AuditUri $Uri $Environment
            if (-not $seen.Add($Uri)) { throw 'Repeated pagination URL; collection is incomplete.' }
            if ($pages -ge $MaxPages) { throw 'Page limit reached; narrow the query or raise MaxPages.' }
            $page = Invoke-AuditGraphGet $Uri
            if ($page -isnot [System.Collections.IDictionary]) { throw 'Unexpected Graph response type.' }
            if ($page.Contains('error')) { throw 'Graph returned an error payload.' }
            if ($Shape -eq 'collection' -and (-not $page.Contains('value') -or $page['value'] -isnot [array])) { throw 'Expected an array in value; response cannot establish collection completeness.' }
            $pages++
            Write-AuditJson $page (Join-Path $Directory ('page-{0:D5}.json' -f $pages))
            if ($Shape -eq 'collection') { foreach ($item in $page['value']) { $items.Add($item) } }
            else { $items.Add($page) }
            $Uri = [string]$page['@odata.nextLink']
        }
    } catch { $status = if ($pages) {'Partial'} else {'Failed'}; $errorText=$_.Exception.Message }
    return @{ status=$status; count=$items.Count; pages=$pages; data=@($items.ToArray()); error=$errorText; completeness='All returned pages for the specified query only; permissions, service retention and object visibility still constrain coverage.' }
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Verify the workload session
.DESCRIPTION
Checks tenant, connection count and Exchange versus Purview session type.
.LINK
https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps
#>
# END GENERATED FUNCTION HELP
function Get-AuditExchangeConnection([guid]$Tenant, [bool]$Purview) {
    $connections = @(ExchangeOnlineManagement\Get-ConnectionInformation | Where-Object { $_.State -eq 'Connected' -and [bool]$_.IsEopSession -eq $Purview })
    if ($connections.Count -ne 1) { throw 'Exactly one connected session of the required Exchange/Purview type is required in this process.' }
    $c=$connections[0]
    if ([string]$c.TenantID -ne $Tenant.ToString() -or $c.DelegatedOrganization -or $c.ModulePrefix) { throw 'Tenant mismatch, delegated organization or prefixed session: refusing ambiguous workload context.' }
    return $c
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Acquire a resource token from the verified context
.DESCRIPTION
Uses the selected existing Az context and retains the token only in memory.
.LINK
https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azaccesstoken
#>
# END GENERATED FUNCTION HELP
function Get-AuditRestToken([string]$Resource, [guid]$Tenant) {
    $context=Az.Accounts\Get-AzContext -ErrorAction Stop
    if (-not $context -or [string]$context.Tenant.Id -ne $Tenant.ToString() -or $context.Environment.Name -ne 'AzureCloud') { throw 'Az context must match the expected tenant in AzureCloud. No workload query was issued.' }
    if ($Resource -notin @('https://api.powerplatform.com','https://analysis.windows.net/powerbi/api','https://api.fabric.microsoft.com')) { throw 'Token resource is not allowlisted.' }
    $token=Az.Accounts\Get-AzAccessToken -ResourceUrl $Resource -TenantId $Tenant.ToString() -AsSecureString -DefaultProfile $context -ErrorAction Stop
    if ($token.Token -isnot [securestring] -or [string]$token.TenantId -ne $Tenant.ToString()) { throw 'Token context could not be verified; no workload query was issued.' }
    return $token.Token
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Assert  Audit Rest Uri
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Assert-AuditRestUri([string]$Uri, [string]$HostName, [string]$Path) {
    $u=[uri]$Uri
    if ($HostName -notin @('api.powerplatform.com','api.powerbi.com','api.fabric.microsoft.com') -or $u.Scheme -ne 'https' -or $u.Host -ne $HostName -or $u.Port -ne 443 -or $u.UserInfo -or $u.Fragment -or $u.AbsolutePath -ne $Path) { throw 'Rejected workload pagination URL; host and operation path must remain fixed.' }
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Send a fixed-method workload GET
.DESCRIPTION
Uses a secure bearer token and disables automatic HTTP redirects.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest
#>
# END GENERATED FUNCTION HELP
function Invoke-AuditRestGet([string]$Uri,[securestring]$Token) {
    $response=Microsoft.PowerShell.Utility\Invoke-WebRequest -Uri $Uri -Method Get -Authentication Bearer -Token $Token -MaximumRedirection 0 -ErrorAction Stop
    return ($response.Content | ConvertFrom-Json -AsHashtable)
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Read  Audit Rest
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Read-AuditRest($Operation,[string]$Path,[guid]$Tenant,[string]$Environment,[int]$MaxPages,[string]$Directory) {
    $items=[System.Collections.Generic.List[object]]::new(); $pages=0; $status='Collected'; $errorText=$null
    try {
        if ($Environment -ne 'Global') { throw 'This REST adapter supports commercial Global only; obtain a documented sovereign-cloud export.' }
        $token=Get-AuditRestToken $Operation.resource $Tenant
        $base='https://'+$Operation.host+$Path; $uri=$base.Replace('{skip}','0'); $fixedPath=([uri]$uri).AbsolutePath
        $seen=[System.Collections.Generic.HashSet[string]]::new(); $skip=0
        while ($uri) {
            Assert-AuditRestUri $uri $Operation.host $fixedPath
            if (-not $seen.Add($uri) -or $pages -ge $MaxPages) { throw 'Workload pagination repeated or page limit reached.' }
            $page=Invoke-AuditRestGet $uri $token
            if ($page -isnot [System.Collections.IDictionary] -or $page[$Operation.array] -isnot [array] -or $page.Contains('error')) { throw 'Expected workload collection is missing or contains an error.' }
            $pages++; Write-AuditJson $page (Join-Path $Directory ('page-{0:D5}.json' -f $pages))
            foreach ($item in $page[$Operation.array]) { $items.Add($item) }
            $uri=$null
            switch ($Operation.paging) {
                'skip' { if ($page[$Operation.array].Count -eq 5000) { $skip+=5000; $uri=$base.Replace('{skip}',[string]$skip) } }
                'token' { if ($page['continuationToken']) { $uri=$base+'?continuationToken='+[uri]::EscapeDataString([string]$page['continuationToken']) } elseif ($page['continuationUri']) { throw 'Continuation URI without a token; cannot establish completeness.' } }
                'nextLink' { $uri=[string]$page['@odata.nextLink']; if (-not $uri) {$uri=[string]$page['@odata.nextlink']} }
                default { throw 'Unsupported workload pagination mode.' }
            }
        }
    } catch {$status=if ($pages) {'Partial'} else {'Failed'}; $errorText=$_.Exception.Message}
    finally {$token=$null}
    return @{status=$status;count=$items.Count;pages=$pages;data=@($items.ToArray());error=$errorText;completeness='All returned pages within caller visibility. Preview availability, administrator scope, service limits and required permissions remain material.'}
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Invoke  Audit Exchange Read
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Invoke-AuditExchangeRead([string]$Command, [hashtable]$Parameters, $Connection) {
    if ($Command -notin $script:ExchangeAllowlist) { throw 'Remote command is not allowlisted.' }
    # Never run a user-defined command shadowing the imported session command.
    $commands = @(Get-Command -Name $Command -All -ErrorAction Stop | Where-Object {
        $_.Module -and ($_.Module.ModuleBase -eq [string]$Connection.ModuleName -or $_.Module.Name -eq [System.IO.Path]::GetFileName([string]$Connection.ModuleName))
    })
    if ($commands.Count -ne 1) { throw 'Cannot bind the read command uniquely to the verified session module. Use a fresh, unprefixed supported session.' }
    $allowedParameters=@('ResultSize','Mailbox','Identity','IncludeHidden','StartDate','EndDate','SessionCommand','SessionId')
    foreach ($p in $Parameters.Keys) { if ($p -notin $allowedParameters) { throw "Unapproved remote parameter: $p" } }
    & $commands[0] @Parameters -ErrorAction Stop -WarningAction Stop
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Collect Exchange and Purview read results
.DESCRIPTION
Preserves command results and reconciles UAL pagination and counts.
.LINK
https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/search-unifiedauditlog?view=exchange-ps
#>
# END GENERATED FUNCTION HELP
function Read-AuditExchange($Operation, [hashtable]$Parameters, [guid]$Tenant, [int]$MaxPages, [string]$Directory) {
    $items=[System.Collections.Generic.List[object]]::new(); $pages=0; $status='Collected'; $errorText=$null
    try {
        if ($Operation.command -notin $script:ExchangeAllowlist) { throw 'Remote command is not allowlisted.' }
        $connection=Get-AuditExchangeConnection $Tenant ($Operation.kind -eq 'purview')
        if ($Operation.id -eq 'ual') {
            $Parameters['SessionId']=[guid]::NewGuid().ToString()
            $seen=[System.Collections.Generic.HashSet[string]]::new(); $expected=-1
            do {
                if ($pages -ge $MaxPages) { throw 'UAL page limit reached.' }
                $page=@(Invoke-AuditExchangeRead $Operation.command $Parameters $connection)
                $pages++
                Write-AuditJson @($page) (Join-Path $Directory ('page-{0:D5}.json' -f $pages))
                foreach ($item in $page) {
                    $h=$item | ConvertTo-Json -Depth 60 | ConvertFrom-Json -AsHashtable
                    if (-not $h['Identity'] -or -not $seen.Add([string]$h['Identity'])) { throw 'UAL missing or repeated Identity; use a narrower interval.' }
                    $items.Add($h)
                    if (-not $h.ContainsKey('ResultCount')) { throw 'UAL ResultCount is missing; completeness cannot be reconciled.' }
                    $expected=[Math]::Max($expected,[int]$h['ResultCount'])
                }
                if ($items.Count -ge 50000) { throw 'UAL 50,000-result ceiling reached; split the interval and reconcile overlap.' }
            } while ($page.Count)
            if ($expected -ge 0 -and $expected -ne $items.Count) { throw 'UAL total does not reconcile to ResultCount.' }
        } else {
            $page=@(Invoke-AuditExchangeRead $Operation.command $Parameters $connection)
            $pages=1
            Write-AuditJson @($page) (Join-Path $Directory 'page-00001.json')
            foreach ($item in $page) { $items.Add(($item | ConvertTo-Json -Depth 60 | ConvertFrom-Json -AsHashtable)) }
        }
    } catch { $status=if ($pages) {'Partial'} else {'Failed'}; $errorText=$_.Exception.Message }
    return @{ status=$status; count=$items.Count; pages=$pages; data=@($items.ToArray()); error=$errorText; completeness='Command result in the verified RBAC scope. Verify documented defaults, warning/cap behavior and the intended population before concluding coverage.' }
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Resolve  Audit Evidence Path
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Resolve-AuditEvidencePath([string]$Root, [string]$Relative) {
    if (-not $Root -or [System.IO.Path]::IsPathRooted($Relative)) { throw 'Evidence paths must be relative to InputRoot.' }
    $rootPath=[System.IO.Path]::GetFullPath($Root).TrimEnd([char[]]'\/')
    $full=[System.IO.Path]::GetFullPath((Join-Path $rootPath $Relative))
    if (-not $full.StartsWith($rootPath+[System.IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'Evidence path escapes InputRoot.' }
    $cursor=Get-Item -LiteralPath $full -Force -ErrorAction Stop
    if ($cursor.PSIsContainer) { throw 'Evidence reference must be a file.' }
    while ($cursor) {
        if ($cursor.Attributes -band [System.IO.FileAttributes]::ReparsePoint) { throw 'Linked evidence paths are not accepted; copy the approved source into the evidence package.' }
        $cursor=if ($cursor -is [System.IO.DirectoryInfo]) {$cursor.Parent} else {$cursor.Directory}
    }
    return $full
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Validate existing workpaper evidence
.DESCRIPTION
Checks record fields, tenant binding and file references, and hashes source files.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash
#>
# END GENERATED FUNCTION HELP
function Read-AuditLocalEvidence($Recipe, [string]$InputRoot, [guid]$Tenant) {
    $gaps=[System.Collections.Generic.List[string]]::new(); $hashes=[System.Collections.Generic.List[object]]::new(); $records=@()
    try {
        $path=Resolve-AuditEvidencePath $InputRoot ($Recipe.id+'.json')
        $package=Get-Content -LiteralPath $path -Raw | ConvertFrom-Json -AsHashtable
        if ($package['tenantId'] -ne $Tenant.ToString() -or $package['id'] -ne $Recipe.id) { throw 'Evidence package tenant or step/control ID mismatch.' }
        if ($package['records'] -isnot [array] -or -not $package['records'].Count) { throw 'Evidence package must contain a nonempty records array.' }
        $records=$package['records']
        if (@($records | Where-Object {$_ -isnot [System.Collections.IDictionary]}).Count) { $records=@(); throw 'Every evidence record must be a JSON object.' }
        $hashes.Add(@{file=$Recipe.id+'.json'; sha256=(Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash})
        foreach ($record in $records) {
            foreach ($field in @('id','owner','observedUtc','evidenceFiles')+$Recipe.requiredFields) {
                if (-not $record.ContainsKey($field) -or $null -eq $record[$field] -or ($record[$field] -is [string] -and ($record[$field] -match '^(TODO|TBD|REPLACE|<.*>)$' -or -not $record[$field].Trim())) -or ($record[$field] -is [array] -and -not $record[$field].Count)) { $gaps.Add("Missing or placeholder field: $field") }
            }
            $parsed=[datetimeoffset]::MinValue
            if (-not [datetimeoffset]::TryParse([string]$record['observedUtc'],[ref]$parsed) -or $parsed -gt [datetimeoffset]::UtcNow.AddMinutes(5)) { $gaps.Add('Invalid or future observedUtc') }
            if ($record['evidenceFiles'] -isnot [array]) { $gaps.Add('evidenceFiles must be an array of relative file names'); continue }
            foreach ($file in $record['evidenceFiles']) {
                try {
                    $full=Resolve-AuditEvidencePath $InputRoot ([string]$file)
                    $hashes.Add(@{file=$file; sha256=(Get-FileHash -LiteralPath $full -Algorithm SHA256).Hash; bytes=(Get-Item -LiteralPath $full).Length})
                } catch { $gaps.Add($_.Exception.Message) }
            }
        }
    } catch { $gaps.Add($_.Exception.Message) }
    return @{status=if ($gaps.Count) {'Incomplete'} else {'EvidencePresent'}; gaps=@($gaps.ToArray()); records=@($records); hashes=@($hashes.ToArray()); limitation='Field presence and hashes establish a reviewable package, not truth, approval validity, historical completeness or control effectiveness.'}
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Screen collected evidence for review
.DESCRIPTION
Identifies consultant review candidates, reconciles devices and calculates recovery metrics.
.LINK
https://learn.microsoft.com/en-us/microsoft-365/backup/backup-faq?view=o365-worldwide
#>
# END GENERATED FUNCTION HELP
function Get-AuditCandidates($Recipe, $Results, $Local) {
    $findings=[System.Collections.Generic.List[object]]::new()
    foreach ($key in $Results.Keys) {
        $result=$Results[$key]; $op=$result.operation
        foreach ($row in $result.data) {
            $reason=$null
            switch ($op) {
                'ca' { if ($row['state'] -ne 'enabled') { $reason="Conditional Access policy state is '$($row['state'])'; compare intended enforcement and alternate controls." } }
                'users' { if ($row.ContainsKey('accountEnabled') -and $row['accountEnabled'] -eq $false -and @($row['assignedLicenses']).Count) { $reason='Disabled account still has assigned licenses; review retention and approved business need before any change.' } }
                'managedDevices' { if ($row['complianceState'] -and $row['complianceState'] -ne 'compliant') { $reason="Managed device reports '$($row['complianceState'])'; reconcile grace period, assignment and access outcome." } }
                'mailboxes' { if ($row['ForwardingSmtpAddress'] -or $row['ForwardingAddress']) { $reason='Mailbox has a forwarding destination; reconcile destination and authorization.' } }
                'inboxRules' { if ($row['ForwardTo'] -or $row['ForwardAsAttachmentTo'] -or $row['RedirectTo']) { $reason='Inbox rule contains forwarding or redirection; inspect enabled state and approved audience.' } }
                'casMailboxes' { if ($row.ContainsKey('SmtpClientAuthenticationDisabled') -and $row['SmtpClientAuthenticationDisabled'] -eq $false) { $reason='Mailbox explicitly allows SMTP AUTH; verify authentication mode and requirement.' } }
                'backupPolicies' { if ($row['status'] -and $row['status'] -ne 'active') { $reason="Backup policy status is '$($row['status'])'; confirm protection coverage and state semantics." } }
                'restoreSessions' { if ($row['status'] -match 'fail|error') { $reason="Restore session has status '$($row['status'])'; inspect artifact outcomes." } }
                'itemPermissions' { if ($row['link'] -and $row['link']['scope'] -eq 'anonymous') { $reason='Item has an anonymous sharing link visible to this caller; compare approved audience.' } }
                'grants' { if ([string]$row['scope'] -match '(ReadWrite|\.All)(\s|$)') { $reason='Broad delegated permission grant requires business justification and resource-scope review.' } }
                'publicEmbeds' { $reason='An artifact is published to the web; reconcile public exposure with approved data classification and owner authorization.' }
            }
            if ($reason) { $findings.Add(@{id=$Recipe.id; operation=$op; objectId=$row['id']; type='ReviewCandidate'; observation=$reason; source=$result.source}) }
            if ($op -in @('apps','principals')) {
                foreach ($credential in @($row['passwordCredentials'])+@($row['keyCredentials'])) {
                    if ($credential -and $credential['endDateTime'] -and [datetimeoffset]$credential['endDateTime'] -le [datetimeoffset]::UtcNow) {
                        $findings.Add(@{id=$Recipe.id; operation=$op; objectId=$row['id']; type='ReviewCandidate'; observation='Expired credential metadata remains on the application identity; determine use, rotation and ownership.'; source=$result.source})
                    }
                }
            }
        }
    }
    foreach ($record in $Local.records) {
        if ($record['startedUtc'] -and $record['acceptedUtc'] -and $record['recoveryPointUtc'] -and $record['incidentUtc'] -and $record.ContainsKey('rtoSeconds') -and $record.ContainsKey('rpoSeconds')) {
            try {
                $duration=([datetimeoffset]$record['acceptedUtc']-[datetimeoffset]$record['startedUtc']).TotalSeconds
                $age=([datetimeoffset]$record['incidentUtc']-[datetimeoffset]$record['recoveryPointUtc']).TotalSeconds
                $rto=[double]$record['rtoSeconds']; $rpo=[double]$record['rpoSeconds']
                if ($duration -lt 0 -or $age -lt 0 -or $rto -lt 0 -or $rpo -lt 0) { throw 'Negative recovery metric' }
                $findings.Add(@{id=$Recipe.id; type='RecoveryMeasurement'; recordId=$record['id']; durationSeconds=$duration; dataAgeSeconds=$age; exceedsRto=($duration -gt $rto); exceedsRpo=($age -gt $rpo); observation='Measured from supplied existing records. Verify integrity, accepted recovery unit and business acceptance separately.'; source=$Recipe.sources[0]})
            } catch { $findings.Add(@{id=$Recipe.id; type='EvidenceGap'; observation='Invalid recovery timestamps or objectives prevent reliable calculation.'}) }
        }
        foreach ($comparison in @($record['comparisons'])) {
            if ($comparison -and $comparison.ContainsKey('expected') -and $comparison.ContainsKey('actual') -and $comparison['requirement']) {
                if (($comparison['expected'] | ConvertTo-Json -Depth 30 -Compress) -cne ($comparison['actual'] | ConvertTo-Json -Depth 30 -Compress)) {
                    $findings.Add(@{id=$Recipe.id; type='RequirementMismatch'; requirement=$comparison['requirement']; expected=$comparison['expected']; actual=$comparison['actual']; recordId=$record['id']; observation='Supplied expected and actual values differ; validate the linked evidence before rating the control.'})
                }
            }
        }
    }
    # Reconcile Entra and Intune identifiers without confusing Entra object ID with deviceId.
    if ($Results.ContainsKey('devices') -and $Results.ContainsKey('managedDevices')) {
        $managed=@($Results['managedDevices'].data | ForEach-Object { $_['azureADDeviceId'] })
        foreach ($device in $Results['devices'].data) {
            if ($device['deviceId'] -and $device['deviceId'] -notin $managed) { $findings.Add(@{id=$Recipe.id; type='PopulationDifference'; objectId=$device['id']; deviceId=$device['deviceId']; observation='Entra device has no matching azureADDeviceId in the collected Intune population. Confirm management expectations and collection coverage.'}) }
        }
    }
    return @($findings.ToArray())
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Invoke  M365 Audit
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Invoke-M365Audit {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string[]]$Id, [guid]$ExpectedTenantId, [string]$OutputRoot, [string]$InputRoot,
        [string]$TargetsPath, [ValidateSet('Collect','Offline')][string]$Mode='Collect',
        [ValidateSet('Global','USGov','USGovDoD','China')][string]$GraphEnvironment='Global',
        [datetimeoffset]$StartUtc=[datetimeoffset]::UtcNow.AddDays(-7), [datetimeoffset]$EndUtc=[datetimeoffset]::UtcNow,
        [ValidateRange(1,100000)][int]$MaxPages=1000, [switch]$UseExistingSessions,
        [string]$GraphClientId, [string]$CertificateThumbprint, [switch]$Plan)
    if ($Id -contains 'AllControls') { $Id=@($script:Recipes.Keys | Where-Object { $script:Recipes[$_].type -eq 'control' } | Sort-Object) }
    $selected=@(foreach ($key in $Id) { if (-not $script:Recipes.ContainsKey($key)) { throw "Unknown control/step: $key" }; $script:Recipes[$key] })
    $operationIds=@($selected.operations | ForEach-Object { $_ } | Sort-Object -Unique)
    if ($Plan) { return @{mode='Plan'; recipes=$selected; operations=@($operationIds | ForEach-Object { $script:Operations[$_] }); tenantAccessed=$false} }
    if ($ExpectedTenantId -eq [guid]::Empty -or -not $OutputRoot) { throw 'ExpectedTenantId and OutputRoot are required except with -Plan.' }
    if ($StartUtc -ge $EndUtc -or $EndUtc -gt [datetimeoffset]::UtcNow.AddMinutes(5)) { throw 'Require StartUtc < EndUtc <= current UTC time.' }
    $repo=[System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..')).TrimEnd([char[]]'\/')
    $output=[System.IO.Path]::GetFullPath($OutputRoot).TrimEnd([char[]]'\/')
    if ($output -eq $repo -or $output.StartsWith($repo+[System.IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'OutputRoot must be outside this public repository.' }
    # Refuse existing links/junctions in output ancestry before creating files.
    $cursor=$output
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) { if ((Get-Item -LiteralPath $cursor -Force).Attributes -band [System.IO.FileAttributes]::ReparsePoint) { throw 'Output ancestry contains a link or junction.' } }
        $parent=[System.IO.Directory]::GetParent($cursor); $cursor=if ($parent) {$parent.FullName} else {$null}
    }
    $targets=@{}
    if ($TargetsPath) {
        $targets=Get-Content -LiteralPath $TargetsPath -Raw | ConvertFrom-Json -AsHashtable
        if ($targets['tenantId'] -ne $ExpectedTenantId.ToString()) { throw 'Targets file tenantId mismatch.' }
    }
    $runDir=Join-Path $output ('audit-'+[datetime]::UtcNow.ToString('yyyyMMddTHHmmssZ')+'-'+[guid]::NewGuid().ToString('N').Substring(0,8))
    $null=New-Item -ItemType Directory -Path $runDir
    $results=@{}; $started=[datetimeoffset]::UtcNow
    if ($Mode -eq 'Collect' -and $operationIds.Count) {
        try {
            $setup=Initialize-AuditSessions @($operationIds | ForEach-Object {$script:Operations[$_]}) $ExpectedTenantId $GraphEnvironment $UseExistingSessions.IsPresent $GraphClientId $CertificateThumbprint
            Write-AuditJson $setup (Join-Path $runDir 'session-setup.json')
        } catch {
            Write-AuditJson @{status='SetupFailed';error=$_.Exception.Message;tenantId=$ExpectedTenantId.ToString();auditQueriesIssued=$false} (Join-Path $runDir 'setup-failure.json')
            throw "Setup failed before audit collection. See $runDir/setup-failure.json. $($_.Exception.Message)"
        }
    }
    foreach ($key in $operationIds) {
        $o=$script:Operations[$key]
        $targetValues=@('')
        if ($o.target) { $targetValues=@($targets[$o.target] | Where-Object { $null -ne $_ -and $_ -ne '' }) }
        if (-not $targetValues.Count) {
            $results[$key]=@{operation=$key; status='MissingTarget'; count=0; data=@(); source=$o.source; error="Supply approved target list '$($o.target)' in TargetsPath. No all-tenant inference is permitted."}; continue
        }
        $number=0
        foreach ($target in $targetValues) {
            $number++; $resultKey=if ($o.target) {"$key-$number"} else {$key}
            $dir=Join-Path $runDir $resultKey; $null=New-Item -ItemType Directory -Path $dir
            try {
                if ($Mode -eq 'Offline') {
                    $r=@{status='NotCollected'; count=0; data=@(); error='Offline mode performs only local evidence validation. Live reads were not attempted.'}
                } elseif ($o.kind -eq 'graph') {
                    Assert-AuditContext (Get-AuditGraphContext) $ExpectedTenantId $GraphEnvironment
                    $path=$o.path.Replace('{start}',$StartUtc.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')).Replace('{end}',$EndUtc.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ'))
                    if ($o.target -eq 'driveItems') {
                        if (-not $target['driveId'] -or -not $target['itemId']) { throw 'Each driveItems target requires driveId and itemId.' }
                        $path=$path.Replace('{driveId}',[uri]::EscapeDataString([string]$target['driveId'])).Replace('{itemId}',[uri]::EscapeDataString([string]$target['itemId']))
                    } else { $path=$path.Replace('{id}',[uri]::EscapeDataString([string]$target)) }
                    if (-not $path.StartsWith('/') -or $path.Contains('..') -or $path.Contains('{')) { throw 'Invalid operation path or unresolved target.' }
                    $uri='https://'+$script:GraphHosts[$GraphEnvironment]+'/v1.0'+$path
                    $r=Read-AuditGraphPages $uri $GraphEnvironment $o.shape $MaxPages $dir
                } elseif ($o.kind -eq 'rest') {
                    $path=$o.path.Replace('{id}',[uri]::EscapeDataString([string]$target))
                    $r=Read-AuditRest $o $path $ExpectedTenantId $GraphEnvironment $MaxPages $dir
                } elseif ($o.kind -in @('exchange','purview')) {
                    $params=@{}
                    foreach ($p in $o.parameters.Keys) {
                        $v=$o.parameters[$p]
                        if ($v -eq '{id}') {$v=[string]$target}
                        elseif ($v -eq '{start}') {$v=$StartUtc.UtcDateTime}
                        elseif ($v -eq '{end}') {$v=$EndUtc.UtcDateTime}
                        $params[$p]=$v
                    }
                    $r=Read-AuditExchange $o $params $ExpectedTenantId $MaxPages $dir
                } else { throw 'Unsupported transport; no operation executed.' }
            } catch { $r=@{status='Failed';count=0;data=@();error=$_.Exception.Message} }
            $r['operation']=$key; $r['source']=$o.source; $r['target']=$target; $r['scope']=if ($o.target) {'Explicit target sample'} else {'Query population within service/RBAC visibility'}
            Write-AuditJson $r (Join-Path $dir 'result.json')
            $results[$resultKey]=$r
        }
    }
    $assessments=@(); $allFindings=@()
    foreach ($recipe in $selected) {
        $local=Read-AuditLocalEvidence $recipe $InputRoot $ExpectedTenantId
        $relevant=@{}; foreach ($k in $results.Keys) { if ($results[$k].operation -in $recipe.operations) { $relevant[$k]=$results[$k] } }
        $incomplete=@($relevant.Values | Where-Object {$_.status -ne 'Collected'})
        $findings=@(Get-AuditCandidates $recipe $relevant $local); $allFindings+=$findings
        $assessment=@{id=$recipe.id; title=$recipe.title; status=if ($incomplete.Count -or $local.status -ne 'EvidencePresent') {'Incomplete'} else {'NeedsReview'}; controlResult='Not assessed'; operations=@($relevant.Keys); incompleteOperations=@($incomplete | ForEach-Object {$_.operation}); localEvidence=$local; candidates=$findings; requiredReview=$recipe.review; criterion=$recipe.criterion; sources=$recipe.sources}
        $assessments+=$assessment
        Write-AuditJson $assessment (Join-Path $runDir ($recipe.id+'.json'))
    }
    $report=@{version='1.1'; tenantId=$ExpectedTenantId.ToString(); cloud=$GraphEnvironment; mode=$Mode; startedUtc=$started.ToString('o'); finishedUtc=[datetimeoffset]::UtcNow.ToString('o'); queryStartUtc=$StartUtc.ToString('o'); queryEndUtc=$EndUtc.ToString('o'); assessments=$assessments; candidates=$allFindings; operationSummary=@($results.Values | Select-Object operation,status,count,scope,source,error); controlResult='Not assessed'; limitation='Read-only evidence acquisition and consultant screening. The acquisition stage performs no remediation, new access test, restore or tenant configuration change. Setup may install local modules and authenticate; see session-setup.json. Missing evidence remains incomplete.'}
    Write-AuditJson $report (Join-Path $runDir 'report.json')
    $assessments | Select-Object id,title,status,controlResult | Export-Csv -LiteralPath (Join-Path $runDir 'coverage.csv') -NoTypeInformation
    Write-AuditJson @($allFindings) (Join-Path $runDir 'candidates.json')
    $manifest=@(Get-ChildItem -LiteralPath $runDir -File -Recurse | ForEach-Object { @{file=[System.IO.Path]::GetRelativePath($runDir,$_.FullName);bytes=$_.Length;sha256=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash} })
    Write-AuditJson $manifest (Join-Path $runDir 'manifest.json')
    return @{outputDirectory=$runDir; controlsOrSteps=$assessments.Count; incomplete=@($assessments | Where-Object {$_.status -eq 'Incomplete'}).Count; candidates=$allFindings.Count; controlResult='Not assessed'}
}
Export-ModuleMember -Function Invoke-M365Audit
