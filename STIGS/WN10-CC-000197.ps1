<#
.SYNOPSIS
    This PowerShell script turns off Microsoft consumer experiences that will help prevent the unwanted installation of suggested applications.

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303
    GitHub          : github.com/Crimson5th
    Date Created    : 2025-25-04
    Last Modified   : 2024-25-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000197

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\e(WN10-CC-000197).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

# Check if the key exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DWORD value
Set-ItemProperty -Path $registryPath -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord
