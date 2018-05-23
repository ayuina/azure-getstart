@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-iishosting .

endlocal


REM ================================================
REM docker tag aspnetcore-iishosting ayuina/aspnetcore-iishosting
REM docker login
REM docker push ayuina/aspnetcore-iishosting