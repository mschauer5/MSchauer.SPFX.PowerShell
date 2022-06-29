
if (Get-Module -ListAvailable -Name 'PnP.PowerShell') {
}
else {
  Install-Module -Name PnP.PowerShell -Force -Verbose -Scope CurrentUser
}

function Push-SPFXPackageACS() {
    param(
        [Parameter(Mandatory=$true)]
		[string] $Url,
        [Parameter(Mandatory=$true)]
		[string] $Path,
        [Parameter(Mandatory=$true)]
        [string] $ClientId,
        [Parameter(Mandatory=$true)]
        [string] $ClientSecret
    )

    Connect-PnPOnline -Url $Url -ClientId $ClientId -ClientSecret $ClientSecret -WarningAction Ignore

    Add-PnPApp -Path $Path -Scope Site -Publish -Overwrite -SkipFeatureDeployment
}

Export-ModuleMember -Function Push-SPFXPackageACS