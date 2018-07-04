
$imagepath = "ayuina/aspnetcore-demoapp-web-linux:latest"
$envset = @{"ConnectionStrings__connection1"="Server=serverName;Database=databaseName;User ID=sqluser;Password=xxxx"}

$now = [DateTime]::Now
$rgName = "demo-{0:MMddHHmm}-aci1-rg" -f $now

function Main()
{
    $rg = Get-AzureRmResourceGroup | where {$_.ResourceGroupName -eq $rgName}
    if($rg -eq $null)
    {
        $rg = New-AzureRmResourceGroup -Name $rgName -Location "japaneast"
    }
    write-host "deploying to $rgName"
    New-AzureRmContainerGroup -ResourceGroupName $rgname -Name demo-aci -Image $imagepath -Location southeastasia -OsType Linux -IpAddressType Public -Port 80  -EnvironmentVariable $envset
    
}

Main