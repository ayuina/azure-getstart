$month = [DateTime]::Now.Month
$day = [datetime]::Now.Day
$rgName = "demo-{0:MMddHHmm}-iaas-rg" -f [DateTime]::Now

function Main()
{
    $rg = Get-AzureRmResourceGroup | where {$_.ResourceGroupName -eq $rgName}
    if($rg -eq $null)
    {
        $rg = New-AzureRmResourceGroup -Name $rgName -Location "japaneast"
    }
    write-host "deploying to $rgName"
    New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile ".\deploy-iaas-demo.json"
    
}

Main