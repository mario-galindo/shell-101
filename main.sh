echo Installing required Azure CLI extensions - this may take a few minutes...

rg=$(az group list --query "[].name" -o tsv);
if [[ "$rg" != *learn* ]]; then
    rgguid=$(uuidgen)
    rgsuffix=${rgguid//[-]/}
    rgsuffix=${rgsuffix:0:18}
    rg=learn${rgsuffix}
    az group create --name $rg --location eastus --output none
fi