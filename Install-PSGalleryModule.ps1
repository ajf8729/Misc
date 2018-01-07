<#
    .Synopsis
        This script will verify PSGallery is registered and trusted, and install the requested PS module for all users if not already installed.
    .Example
        ./Install-PSGalleryModule.ps1 -ModuleName SqlServer
    .Notes
        NAME: Install-PSGalleryModule.ps1
        AUTHOR: Anthony Fontanez (ajfrcc@gmail.com)
        VERSION: 1.0
        LASTEDIT: 2017-05-02
        CHANGELOG:
            1.0 (2017-05-02) Initial script creation
#>

[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True,Position=1)]
   [string]$ModuleName
)

$CurrentDateTime = Get-Date -UFormat %Y-%m-%d-%H-%M-%S
$LogFile = "$env:SystemDrive\Logs\Install-PSGalleryModule_$($ModuleName)_$CurrentDateTime.log"

Start-Transcript -Path "$LogFile" | Out-Null

$PSGalleryExists = Get-PSRepository -Name PSGallery
if ($PSGalleryExists -eq $null) {
    Register-PSRepository -Default
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}

$ModuleExists = Get-Module -Name $ModuleName
if ($ModuleExists -eq $null) {
    Install-Module -Name $ModuleName -Repository PSGallery -Scope AllUsers -Verbose
}

Stop-Transcript | Out-Null