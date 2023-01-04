if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

Write-Output "Installing Chocolatey --------------------------------------------------"
Write-Output ""

Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

Write-Output ""
Write-Output "Installing Programs --------------------------------------------------"
Write-Output ""

# dev
#choco install python3
choco install git
choco install vscode
#choco install oraclejdk
#choco install javaruntime

# utility
choco install 7zip.install
choco install vlc
choco install firefox
choco install lightshot
#choco install notepadplusplus.install
#choco install qbittorrent
choco install openhardwaremonitor

# games
choco install steam-client
choco install discord.install

choco feature disable -n allowGlobalConfirmation
Write-Output ""

Write-Host -NoNewLine "Press any key to exit...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
