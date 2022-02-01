write-host 'AIB Customization: Downloading FsLogix'
New-Item -Path C:\\ -Name fslogix -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\fslogix'
set-Location $LocalPath

$fsLogixURL="https://aka.ms/fslogix_download"
$installerFile="FSLogixAppsSetup.zip"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $fsLogixURL -OutFile $LocalPath\$installerFile
Expand-Archive $LocalPath\$installerFile -DestinationPath $LocalPath
write-host 'AIB Customization: Download Fslogix installer finished'

write-host 'AIB Customization: Start Fslogix installer'
$fslogix_deploy_status = Start-Process `
    -FilePath "$LocalPath\FSLogix\x64\Release\FSLogixAppsSetup.exe" `
    -ArgumentList "/install /quiet" `
    -Wait `
    -Passthru
write-host 'AIB Customization: Finished Fslogix installer' 