@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-demoapp:nano .

endlocal

REM ================================================
REM docker run -d -e 'ConnectionStrings:connection1=Server=...;Database=...;User ID=...;Password=...' aspnetcore-demoapp:nano
REM docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" containerId

REM ================================================
REM docker tag aspnetcore-demoapp:iis ayuina/aspnetcore-demoapp:iis
REM docker login
REM docker push ayuina/aspnetcore-demoapp:iis