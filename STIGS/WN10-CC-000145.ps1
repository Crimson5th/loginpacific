<#
.SYNOPSIS
    This PowerShell script  setting ensures the user is prompted for a password on resume from sleep (on battery).

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2024-24-04
    Last Modified   : 2024-24-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000145.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Create the key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DCSettingIndex value to 1
Set-ItemProperty -Path $registryPath -Name "DCSettingIndex" -Value 1 -Type DWord

Write-Output "DCSettingIndex set to 1 at $registryPath"
