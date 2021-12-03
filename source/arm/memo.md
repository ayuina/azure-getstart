
# arm template deployment with az command

az deployment group create -g *rgname* -f armtemplae.json -n *deploymentName* -p prefix=*hoge*