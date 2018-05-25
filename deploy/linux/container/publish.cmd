@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-demoapp:linux .

endlocal


REM ================================================
REM docker run -d -p 8888:80 -e 'ConnectionStrings__connection1=Server=tcp:demo0525dbsvr.database.windows.net,1433;Database=demo0525db;User ID=sqluser;Password=xxxx' aspnetcore-demoapp:linux

REM docker tag aspnetcore-demoapp:linux ayuina/aspnetcore-demoapp:linux
REM docker push ayuina/aspnetcore-demoapp:linux