@echo off
setlocal

cd %~dp0
docker build -t aspnetcore-demoapp:linux .

endlocal


REM ================================================
REM docker run -d -p 8888:80 -e 'ConnectionStrings__connection1=Server=serverName;Database=databaseName;User ID=sqluser;Password=xxxx' aspnetcore-demoapp:linux
REM docker tag aspnetcore-demoapp:linux ayuina/aspnetcore-demoapp:linux
REM docker push ayuina/aspnetcore-demoapp:linux

REM ================================================
REM PS $envset = @{"ConnectionStrings__connection1"="Server=serverName;Database=databaseName;User ID=sqluser;Password=xxxx"}
REM PS New-AzureRmContainerGroup -ResourceGroupName rgname-rg -Name demo-aci -Image ayuina/aspnetcore-demoapp:linux -Location southeastasia -OsType Linux -IpAddressType Public -Port 80  -EnvironmentVariable $envset
