
param(
  [switch]$isHomeInstall = $false
)

# install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# applications
choco install firefox
choco install 7zip.install
choco install vscode
choco install powertoys

If($isHomeInstall) {
  choco install spotify
  choco install steam
}
