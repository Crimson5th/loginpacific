 <#
.SYNOPSIS
    Keys stored in the TPM may only be used on that system

.NOTES
    Author          : Quintin Harrigin
    LinkedIn        : linkedin.com/in/quintin-harrigin-21033b303/
    GitHub          : github.com/Crimson5th
    Date Created    : 2025-19-05
    Last Modified   : 2025-19-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000255).ps1 
#>

# Ensure the registry path exists
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the DWORD value
New-ItemProperty -Path $regPath -Name "RequireSecurityDevice" -Value 1 -PropertyType DWord -Force
