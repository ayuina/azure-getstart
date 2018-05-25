@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-demoapp:linux .

endlocal


REM ================================================
REM docker run -d -p 8888:80 -e 'ConnectionStrings:connection1=xxxxx' aspnetcore-demoapp:linux

REM docker tag aspnetcore-demoapp:linux ayuina/aspnetcore-demoapp:linux
REM docker push ayuina/aspnetcore-demoapp:linux