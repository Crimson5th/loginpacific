<#
.SYNOPSIS
    This PowerShell script ensures the Windows Defender SmartScreen filter in Microsoft Edge provides warning messages and blocks potentially malicious websites and file downloads.

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2024-27-04
    Last Modified   : 2024-27-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000230

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000230).ps1 
#>

# Define the registry path where the settings will be applied
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the DWORD value "PreventOverride" to 1
# This enables the policy to prevent users from bypassing SmartScreen warnings
New-ItemProperty -Path $registryPath -Name "PreventOverride" -PropertyType DWord -Value 1 -Force

# Confirm the value was set
Get-ItemProperty -Path $registryPath -Name "PreventOverride"
