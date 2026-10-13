#requires -Version 7.2
<#
.SYNOPSIS
Create blank local audit workpaper packages for selected controls or steps.
.DESCRIPTION
Writes the exact required evidence fields as null values in a local input folder.
No tenant connection is made. Existing files are never overwritten. Replace nulls
with attributable observations and relative evidence file paths before assessment.
These are consultant workpaper schemas, not Microsoft product data structures.
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json
.LINK
https://learn.microsoft.com/en-us/purview/audit-search
#>
[CmdletBinding()]
param([Parameter(Mandatory)][string[]]$Id,[Parameter(Mandatory)][guid]$ExpectedTenantId,[Parameter(Mandatory)][string]$InputRoot)
$ErrorActionPreference='Stop'
$recipes=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'recipes.json') -Raw | ConvertFrom-Json -AsHashtable
if ($Id -contains 'AllControls') { $Id=@($recipes.Keys | Where-Object {$recipes[$_].type -eq 'control'} | Sort-Object) }
$repo=[System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..')).TrimEnd([char[]]'\/')
$inputPath=[System.IO.Path]::GetFullPath($InputRoot).TrimEnd([char[]]'\/')
if ($inputPath -eq $repo -or $inputPath.StartsWith($repo+[System.IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'InputRoot must be outside this public repository.' }
foreach($key in $Id) { if(-not $recipes.ContainsKey($key)) {throw "Unknown control/step: $key"} }
$null=New-Item -ItemType Directory -Path $inputPath -Force
foreach($key in $Id) {
    $file=Join-Path $inputPath ($key+'.json')
    $record=[ordered]@{id=$null;observedUtc=$null;owner=$null;evidenceFiles=@()}
    foreach($field in $recipes[$key].requiredFields) {$record[$field]=$null}
    $record['comparisons']=@()
    $package=[ordered]@{id=$key;tenantId=$ExpectedTenantId.ToString();records=@($record)}
    $stream=[System.IO.File]::Open($file,[System.IO.FileMode]::CreateNew,[System.IO.FileAccess]::Write)
    try {
        $writer=[System.IO.StreamWriter]::new($stream,[System.Text.UTF8Encoding]::new($false))
        try {$writer.Write(($package | ConvertTo-Json -Depth 20))} finally {$writer.Dispose()}
    } finally {$stream.Dispose()}
    Write-Output $file
}
