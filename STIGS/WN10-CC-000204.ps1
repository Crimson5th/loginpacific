<#
.SYNOPSIS
    This PowerShell script: If Enhanced diagnostic data is enabled it must be limited to the minimum required to support Windows Analytics.

.NOTE
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2024-26-04
    Last Modified   : 2024-26-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000204

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\(STIG-ID-WN10-CC-000204).ps1 
#>

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "LimitEnhancedDiagnosticDataWindowsAnalytics" -Value 1 -Type DWord
