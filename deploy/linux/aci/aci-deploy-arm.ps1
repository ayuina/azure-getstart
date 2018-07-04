$now = [DateTime]::Now
$rgName = "demo-{0:MMddHHmm}-aci-arm-rg" -f $now
$deploymentname = "deploy-aci-demo-{0:yyyyMMdd}-{0:HHmmss}" -f $now

function Main()
{
    $rg = Get-AzureRmResourceGroup | where {$_.ResourceGroupName -eq $rgName}
    if($rg -eq $null)
    {
        $rg = New-AzureRmResourceGroup -Name $rgName -Location "japaneast"
    }
    write-host "deploying to $rgName"
    New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile ".\aci-deploy-arm.json" -Name $deploymentname
    
}

Main