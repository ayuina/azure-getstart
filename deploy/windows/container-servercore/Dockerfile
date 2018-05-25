FROM microsoft/aspnetcore-build as build-env
RUN git clone https://github.com/ayuina/azure-getstart.git
RUN dotnet publish c:\azure-getstart\source\DemoApps -f netcoreapp2.0 -r win-x64 --self-contained -o c:\publish


###########################

FROM microsoft/windowsservercore 
#Install IIS
RUN powershell -Command Add-WindowsFeature Web-Server

#Install ASP.NET core Hosting Bundle Installer
ADD ["https://download.microsoft.com/download/A/9/F/A9F8872C-48B2-41DB-8AAD-D5908D988592/DotNetCore.2.0.7-WindowsHosting.exe", "C:\\"] 
RUN ["C:\\DotNetCore.2.0.7-WindowsHosting.exe", "/quiet", "/log", "log.txt"]

#Deploy Application
WORKDIR C:\\inetpub\\wwwroot
COPY --from=build-env C:\\publish .
ENV ConnectionStrings:connection1=hoge

#restart iis
RUN iisreset

#Install Service Monitor
ADD ["https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.3/ServiceMonitor.exe", "C:\\"]

EXPOSE 80
ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
