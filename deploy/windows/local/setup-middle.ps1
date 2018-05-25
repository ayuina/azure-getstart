#install iis
Add-WindowsFeature -Name "web-server" -IncludeAllSubFeature -IncludeManagementTools

#install asp.net core hosting bundle
#https://www.microsoft.com/net/download/dotnet-core/runtime-2.0.7
Invoke-WebRequest -UseBasicParsing -Uri "https://download.microsoft.com/download/A/9/F/A9F8872C-48B2-41DB-8AAD-D5908D988592/DotNetCore.2.0.7-WindowsHosting.exe" -OutFile "C:\DotNetCore.2.0.7-WindowsHosting.exe"
Start-Process "C:\DotNetCore.2.0.7-WindowsHosting.exe" -ArgumentList @("/quiet", "/log", "log.txt") -NoNewWindow　-Wait

#restart iis
Start-Process "iisreset"  -NoNewWindow
