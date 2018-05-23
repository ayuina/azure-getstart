@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-iishosting .

endlocal