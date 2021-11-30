
$publishid = "{0:yyyyMMdd}-{0:HHmmssfff}" -f [DateTime]::Now
dotnet publish -o ".\publish\$publishid"
Compress-Archive -Path ".\publish\$publishid\*" -DestinationPath ".\publish\${publishid}.zip"