FROM microsoft/aspnetcore-build:2.0 as build-env
RUN git clone https://github.com/ayuina/azure-getstart.git
RUN dotnet publish c:\azure-getstart\source\DemoApps -f netcoreapp2.0 -o c:\publish


###########################################
FROM microsoft/aspnetcore:2.0

#Deploy Application
WORKDIR C:\\app
COPY --from=build-env C:\\publish C:\\app
ENV ConnectionStrings:connection1=nanoenv
ENV ASPNETCORE_URLS=http://*:80
EXPOSE 80
ENTRYPOINT ["dotnet", "WebAPplication1.dll"]


