@echo off

setlocal
cd %~dp0

set source="%~dp0\..\..\..\source\DemoApps"
set output="%~dp0\publish"

rmdir /S /Q %output%
dotnet publish %source% -o %output% -f netcoreapp2.0 -r win-x64 --self-contained

docker build -t aspnetcore-demoapp .

endlocal