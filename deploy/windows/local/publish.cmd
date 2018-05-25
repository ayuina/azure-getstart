@echo off

setlocal
cd %~dp0

set source="%~dp0\..\..\..\source\DemoApps"
set output="%~dp0\publish"
dotnet publish %source% -f netcoreapp2.0 -r win-x64 --self-contained -o %output%

echo compressing
powershell.exe Compress-Archive .\publish\* -DestinationPath .\publish.zip

endlocal

