
<#.SYNOPSIS
    Simple Script that demonstrate Hyrbrid Work with Azure Arc functionality in another cloud or data center.
#>

[CmdletBinding()]
param (
    [parameter(mandatory = $true)]$resourceId
)

$creds = Get-AutomationPSCredential -Name "admin"

$vm = $resourceId.Split("/")[8]

Write-Output ( $objOut | ConvertTo-Json)

Invoke-Command -ComputerName $vm -credential $creds -Scriptblock {
    Write-Output "Computer Name"
    $env:COMPUTERNAME
}