FROM microsoft/aspnetcore-build as build-env
RUN git clone https://github.com/ayuina/azure-getstart.git
RUN dotnet publish c:\azure-getstart\source\DemoApps -f netcoreapp2.0 -r win-x64 --self-contained -o c:\publish


FROM aspnetcore-iishosting
WORKDIR C:\\inetpub\\wwwroot
COPY --from=build-env C:\\publish .
ENV ConnectionStrings:connection1=hoge
