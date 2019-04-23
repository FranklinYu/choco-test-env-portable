$env:ChocolateyInstall = "$env:LocalAppData\chocolatey"
Invoke-WebRequest 'https://chocolatey.org/install.ps1' -UseBasicParsing | Invoke-Expression
