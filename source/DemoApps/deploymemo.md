
# publish dotnet webapp

$publishid = "{0:yyyyMMdd}-{0:HHmmssfff}" -f [DateTime]::Now
dotnet publish -o ".\publish\$publishid"
Compress-Archive -Path ".\publish\$publishid\*" -DestinationPath ".\publish\${publishid}.zip"

# zip deploy
https://docs.microsoft.com/ja-jp/azure/app-service/deploy-zip?tabs=cli
az webapp deploy --resource-group <group-name> --name <app-name> --src-path <zip-package-path>