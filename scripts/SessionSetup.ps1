#requires -Version 7.4
<#
.SYNOPSIS
Prepare modules and authenticated sessions before Microsoft 365 audit reads.
.DESCRIPTION
Checks required modules, installs a missing or insufficient version for CurrentUser
from the official PowerShell Gallery, imports it, connects the selected workloads,
and verifies tenant/cloud context. This setup stage is separate from read-only
tenant collection. Authentication can require user interaction or prior consent.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x
.LINK
https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0
.LINK
https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps
.LINK
https://learn.microsoft.com/en-us/powershell/exchange/connect-to-scc-powershell?view=exchange-ps
.LINK
https://learn.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount
#>
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Get  Audit Available Module
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Get-AuditAvailableModule([string]$Name,[version]$MinimumVersion) {
    Get-Module -ListAvailable -Name $Name | Where-Object {$_.Version -ge $MinimumVersion} | Sort-Object Version -Descending | Select-Object -First 1
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Install  Audit Required Module
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Install-AuditRequiredModule([string]$Name,[version]$MinimumVersion) {
    # A fixed allowlist prevents recipe/input files from choosing arbitrary packages.
    if ($Name -notin @('Microsoft.Graph.Authentication','ExchangeOnlineManagement','Az.Accounts')) {throw 'Module is not allowlisted.'}
    if (-not (Get-Command 'Microsoft.PowerShell.PSResourceGet\Install-PSResource' -ErrorAction SilentlyContinue)) {throw 'PowerShell 7.4+ with its PSResourceGet module is required for automatic setup.'}
    $repository=Microsoft.PowerShell.PSResourceGet\Get-PSResourceRepository -Name PSGallery -ErrorAction Stop
    if ([string]$repository.Uri -notin @('https://www.powershellgallery.com/api/v2','https://www.powershellgallery.com/api/v2/')) {throw 'PSGallery URL does not match the official repository.'}
    Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name $Name -Version "[$MinimumVersion,)" -Repository PSGallery -Scope CurrentUser -TrustRepository -ErrorAction Stop
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Import  Audit Required Module
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Import-AuditRequiredModule($Module) {
    Import-Module -Name $Module.Path -Global -ErrorAction Stop
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Get  Audit Setup Graph Context
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Get-AuditSetupGraphContext {
    Microsoft.Graph.Authentication\Get-MgContext
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Connect  Audit Graph Session
.DESCRIPTION
Implements a local guard or dispatch step used by the documented audit workflow; see the surrounding function body and operation register.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions
#>
# END GENERATED FUNCTION HELP
function Connect-AuditGraphSession([hashtable]$Parameters) {
    $null=Microsoft.Graph.Authentication\Connect-MgGraph @Parameters
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Make a required module available
.DESCRIPTION
Checks availability, installs a missing supported version, then imports it.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.psresourceget/install-psresource?view=powershellget-3.x
#>
# END GENERATED FUNCTION HELP
function Initialize-AuditModule([string]$Name,[version]$MinimumVersion,[bool]$UseExistingSessions) {
    $module=Get-AuditAvailableModule $Name $MinimumVersion
    $installed=$false
    if (-not $module) {
        if ($UseExistingSessions) {throw "Required module missing or too old: $Name >= $MinimumVersion. Existing-session mode does not install."}
        Write-Information "Installing required audit module $Name for CurrentUser from PSGallery." -InformationAction Continue
        Install-AuditRequiredModule $Name $MinimumVersion
        $installed=$true
        $module=Get-AuditAvailableModule $Name $MinimumVersion
        if (-not $module) {throw "Installation did not provide the required module: $Name"}
    }
    Import-AuditRequiredModule $module
    return @{name=$Name;version=$module.Version.ToString();installedThisRun=$installed}
}
# BEGIN GENERATED FUNCTION HELP
<#
.SYNOPSIS
Authenticate before audit commands
.DESCRIPTION
Prepares modules, connects selected services and verifies the expected tenant.
.LINK
https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0
#>
# END GENERATED FUNCTION HELP
function Initialize-AuditSessions($Operations,[guid]$Tenant,[string]$Environment,[bool]$UseExistingSessions,[string]$GraphClientId,[string]$CertificateThumbprint) {
    $records=@(); $kinds=@($Operations.kind | Sort-Object -Unique)
    # All required modules are available/imported before the first connection.
    if ('graph' -in $kinds) {$records+=Initialize-AuditModule 'Microsoft.Graph.Authentication' ([version]'2.0.0') $UseExistingSessions}
    if ('exchange' -in $kinds -or 'purview' -in $kinds) {$records+=Initialize-AuditModule 'ExchangeOnlineManagement' ([version]'3.9.0') $UseExistingSessions}
    if ('rest' -in $kinds) {$records+=Initialize-AuditModule 'Az.Accounts' ([version]'4.0.0') $UseExistingSessions}
    if ('graph' -in $kinds) {
        $context=Get-AuditSetupGraphContext
        $scopes=@($Operations | Where-Object {$_.kind -eq 'graph' -and $_.delegatedSupported} | ForEach-Object {$_.scopes} | Sort-Object -Unique)
        $valid=$context -and [string]$context.TenantId -eq $Tenant.ToString() -and $context.Environment -eq $Environment
        if ($valid -and $GraphClientId) { $valid=$context.AuthType -eq 'AppOnly' -and [string]$context.ClientId -eq $GraphClientId }
        if ($valid -and $context.AuthType -eq 'Delegated') { $valid=@($scopes | Where-Object {$_ -notin $context.Scopes}).Count -eq 0 }
        if (-not $valid) {
            if ($UseExistingSessions) {throw 'Graph session is missing, mismatched or lacks the planned delegated scopes.'}
            $connection=@{TenantId=$Tenant.ToString();Environment=$Environment;ContextScope='Process';NoWelcome=$true;ErrorAction='Stop'}
            if ($GraphClientId -or $CertificateThumbprint) {
                if (-not $GraphClientId -or -not $CertificateThumbprint) {throw 'Supply both GraphClientId and CertificateThumbprint for certificate authentication.'}
                $connection['ClientId']=$GraphClientId; $connection['CertificateThumbprint']=$CertificateThumbprint
            } else {
                if (-not $scopes.Count) {throw 'Selected Graph operations require application access. Supply an approved application ID/certificate or a pre-existing application session.'}
                $connection['Scopes']=$scopes
            }
            Connect-AuditGraphSession $connection
        }
        Assert-AuditContext (Get-AuditSetupGraphContext) $Tenant $Environment
    }
    foreach ($kind in @('exchange','purview')) {
        if ($kind -notin $kinds) {continue}
        $purview=$kind -eq 'purview'
        $current=@(ExchangeOnlineManagement\Get-ConnectionInformation | Where-Object {$_.State -eq 'Connected' -and [bool]$_.IsEopSession -eq $purview})
        if (-not $current.Count) {
            if ($UseExistingSessions) {throw "Missing $kind session in existing-session mode."}
            if ($purview) {
                $connection=@{ErrorAction='Stop'}
                switch ($Environment) {
                    'USGov' {$connection['ConnectionUri']='https://ps.compliance.protection.office365.us/powershell-liveid/';$connection['AzureADAuthorizationEndpointUri']='https://login.microsoftonline.us/organizations'}
                    'USGovDoD' {$connection['ConnectionUri']='https://l5.ps.compliance.protection.office365.us/powershell-liveid/';$connection['AzureADAuthorizationEndpointUri']='https://login.microsoftonline.us/organizations'}
                    'China' {$connection['ConnectionUri']='https://ps.compliance.protection.partner.outlook.cn/powershell-liveid/';$connection['AzureADAuthorizationEndpointUri']='https://login.chinacloudapi.cn/organizations'}
                }
                $null=ExchangeOnlineManagement\Connect-IPPSSession @connection
            } else {
                $exchangeEnvironment=@{Global='O365Default';USGov='O365USGovGCCHigh';USGovDoD='O365USGovDoD';China='O365China'}[$Environment]
                $null=ExchangeOnlineManagement\Connect-ExchangeOnline -ExchangeEnvironmentName $exchangeEnvironment -ShowBanner:$false -ErrorAction Stop
            }
        }
        $null=Get-AuditExchangeConnection $Tenant $purview
    }
    if ('rest' -in $kinds) {
        if ($Environment -ne 'Global') {throw 'Power Platform/Fabric REST bootstrap supports Global only; scope these reads separately for sovereign clouds.'}
        $context=Az.Accounts\Get-AzContext -ErrorAction SilentlyContinue
        if (-not $context -or [string]$context.Tenant.Id -ne $Tenant.ToString() -or $context.Environment.Name -ne 'AzureCloud') {
            if ($UseExistingSessions) {throw 'Az context is missing or mismatched in existing-session mode.'}
            $null=Az.Accounts\Connect-AzAccount -Tenant $Tenant.ToString() -Environment AzureCloud -SkipContextPopulation -ErrorAction Stop
        }
        $context=Az.Accounts\Get-AzContext -ErrorAction Stop
        if ([string]$context.Tenant.Id -ne $Tenant.ToString() -or $context.Environment.Name -ne 'AzureCloud') {throw 'Az authentication returned an unexpected tenant/cloud.'}
    }
    return @{modules=$records;tenantId=$Tenant.ToString();environment=$Environment;mode=if($UseExistingSessions){'ExistingSessions'}else{'InstallMissingThenAuthenticate'};verifiedUtc=[datetimeoffset]::UtcNow.ToString('o')}
}
