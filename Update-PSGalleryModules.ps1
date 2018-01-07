<#
    .Synopsis
        This script will verify PSGallery is registered and trusted, and update all installed modules from PSGallery.
    .Example
        ./Update-PSGalleryModules.ps1
    .Notes
        NAME: Update-PSGalleryModules.ps1
        AUTHOR: Anthony Fontanez (ajfrcc@gmail.com)
        VERSION: 1.0
        LASTEDIT: 2017-05-02
        CHANGELOG:
            1.0 (2017-05-02) Initial script creation
#>

$LogFile = "$env:SystemDrive\Logs\Update-PSGalleryModules.log"

Start-Transcript -Path "$LogFile" -Append | Out-Null

$PSGalleryExists = Get-PSRepository -Name PSGallery
if ($PSGalleryExists -eq $null) {
    Register-PSRepository -Default
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}

Update-Module -Verbose

Stop-Transcript | Out-Null