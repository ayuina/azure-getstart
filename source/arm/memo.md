
# arm template deployment with az command

```bash
PREFIX=demo`date "+%m%d"`
LOCATION=japanwest
RG_NAME=${PREFIX}-rg
az group create --name $RG_NAME --location $LOCATION

DEPLOYMENT_NAME=ARMDEPLOY_`date "+%Y%m%d_%H%M%S"`
az deployment group create -g $RG_NAME -n $DEPLOYMENT_NAME -f armtemplate.json \
    -p prefix=$PREFIX -p location=$LOCATION -p sqlPassword=

```