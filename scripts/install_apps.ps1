Write-Output "Installing Chocolatey --------------------------------------------------"
Write-Output ""

Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Output ""
Write-Output "Configuring Chocolatey --------------------------------------------------"
Write-Output ""

choco feature enable -n allowGlobalConfirmation

Write-Output ""
Write-Output "Installing Programs --------------------------------------------------"
Write-Output ""

# dev
choco install python3 -y
choco install git -y
choco install vscode -y
choco install oraclejdk -y
choco install javaruntime -y

# utility
choco install 7zip.install  -y
choco install vlc -y
choco install firefox -y
choco install lightshot -y
choco install notepadplusplus.install -y
choco install qbittorrent -y

# games
choco install steam-client -y
choco install discord.install -y