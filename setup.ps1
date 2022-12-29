Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

& {

    $P = $env:TEMP + '\chromeremotedesktophost.msi'

    Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P

    Start-Process $P -Wait

    Remove-Item $P

}

& {

    $P = $env:TEMP + '\chrome_installer.exe'

    Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P

    Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait

    Remove-Item $P

}

$url = 'https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-611.exe'

$localPath = $env:USERPROFILE + '\Desktop\winrar.exe'

Invoke-WebRequest $url -OutFile $localPath

$url = 'https://telegram.org/dl/desktop/win64'

$localPath = $env:USERPROFILE + '\Desktop\telegram.exe'

Invoke-WebRequest $url -OutFile $localPath

