$now = [DateTime]::Now
$month = $now.Month
$day = $now.Day
$rgName = "demo-{0:MMddHHmm}-iaas-rg" -f $now
$deploymentname = "deploy-iaas-demo-{0:yyyyMMdd}-{0:HHmmss}" -f $now

function Main()
{
    $rg = Get-AzureRmResourceGroup | where {$_.ResourceGroupName -eq $rgName}
    if($rg -eq $null)
    {
        $rg = New-AzureRmResourceGroup -Name $rgName -Location "japaneast"
    }
    write-host "deploying to $rgName"
    New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile ".\deploy-iaas-demo.json" -Name $deploymentname
    
}

Main