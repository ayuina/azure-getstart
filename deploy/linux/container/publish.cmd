@echo off
setlocal

cd %~dp0
set repo=ayuina
set timestamp=%DATE:~-10,4%%DATE:~-5,2%%DATE:~-2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set tag=aspnetcore-demoapp-web-linux:%timestamp%
set latest=aspnetcore-demoapp-web-linux:latest

echo building web app as %tag%
docker build -t %tag% .

echo publishing web app to %repo%/%tag%
docker login
if not %errorlevel% == 0 (
    exit /b %errorlevel%
)

docker tag %tag% %repo%/%tag%
docker push %repo%/%tag%
docker tag %tag% %repo%/%latest%
docker push %repo%/%latest%

endlocal


REM ================================================
REM docker run -d -p 8888:80 -e 'ConnectionStrings__connection1=Server=serverName;Database=databaseName;User ID=sqluser;Password=xxxx' aspnetcore-demoapp:linux
REM docker tag aspnetcore-demoapp:linux ayuina/aspnetcore-demoapp:linux
REM docker push ayuina/aspnetcore-demoapp:linux

REM ================================================
REM PS $envset = @{"ConnectionStrings__connection1"="Server=serverName;Database=databaseName;User ID=sqluser;Password=xxxx"}
REM PS New-AzureRmContainerGroup -ResourceGroupName rgname-rg -Name demo-aci -Image ayuina/aspnetcore-demoapp:linux -Location southeastasia -OsType Linux -IpAddressType Public -Port 80  -EnvironmentVariable $envset
