<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Defender SmartScreen filter in Microsoft Edge provides warning messages and blocks potentially malicious websites and file downloads.

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2025-03-05
    Last Modified   : 2025-03-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000235

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000235).ps1 
#>

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry values
Set-ItemProperty -Path $regPath -Name "PreventOverride" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath -Name "PreventOverrideAppRepUnknown" -Value 1 -Type DWord

