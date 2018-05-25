@echo off

setlocal
cd %~dp0

docker build -t aspnetcore-demoapp:servercore .

endlocal

REM ================================
REM docker run -d adpnetcore-demoapp
REM docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" containerId
REM start http://ip.address.from.inspect/