#requires -Version 7.4
<#
.SYNOPSIS
Run Microsoft 365 audit controls or numbered evidence steps.
.DESCRIPTION
Selects documented read-only recipes, collects existing tenant evidence, validates
local workpapers and writes a report outside the public repository. Use -Plan for
exact operations, permissions and Microsoft references without tenant access.
.LINK
https://learn.microsoft.com/en-us/graph/permissions-overview
.LINK
https://learn.microsoft.com/en-us/graph/paging
.LINK
https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation?view=exchange-ps
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string[]]$Id,
    [guid]$ExpectedTenantId,
    [string]$OutputRoot,
    [string]$InputRoot,
    [string]$TargetsPath,
    [ValidateSet('Collect','Offline')][string]$Mode='Collect',
    [ValidateSet('Global','USGov','USGovDoD','China')][string]$GraphEnvironment='Global',
    [datetimeoffset]$StartUtc=[datetimeoffset]::UtcNow.AddDays(-7),
    [datetimeoffset]$EndUtc=[datetimeoffset]::UtcNow,
    [ValidateRange(1,100000)][int]$MaxPages=1000,
    [switch]$UseExistingSessions,
    [string]$GraphClientId,
    [string]$CertificateThumbprint,
    [switch]$Plan
)
Import-Module (Join-Path $PSScriptRoot 'M365Audit.psm1') -Force
Invoke-M365Audit @PSBoundParameters
