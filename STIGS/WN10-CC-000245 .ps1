<#
.SYNOPSIS
    This PowerShell script disables the Edge password manager.

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2025-05-05
    Last Modified   : 2025-05-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>


# Set the base registry path
$basePath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge"
$mainPath = "$basePath\Main"

# Create the registry key path if it doesn't exist
If (-Not (Test-Path $mainPath)) {
    New-Item -Path $mainPath -Force | Out-Null
}

# Set the "FormSuggest Passwords" value to "no"
Set-ItemProperty -Path $mainPath -Name "FormSuggest Passwords" -Value "no" -Type String
