FROM microsoft/aspnetcore-build:2.0 as build-env
WORKDIR /build
RUN git clone https://github.com/ayuina/azure-getstart.git
RUN dotnet publish ./azure-getstart/source/DemoApps -f netcoreapp2.0 -r linux-x64 --self-contained -o /build/publish

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env /build/publish .
ENV ConnectionStrings:connection1=hoge
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
ENTRYPOINT [ "dotnet", "WebApplication1.dll" ]

