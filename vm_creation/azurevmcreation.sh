#!/bin/bash

#Azure Resource Configuration File
source config.sh

echo "Resource Group Creation!!"
az group create --name $resource_group --location $resource_location

echo "VM Creation in progress!!"

az vm create \
    --resource-group $resource_group \
    --name $vmname \
    --image $vmimage \
    --storage-sku $vmstorage \
	--size $vmsize \
    --public-ip-sku $public_ip_sku \
    --admin-username $vmusername \
	--admin-password $vmpassword

#VM creation check
vm_show=$(az vm show --resource-group myResourceGroup --name UbuntuVM --query "provisioningState" --output tsv)	

if [ $vm_show = "Succeeded" ]
then
   echo "VM creation is successfull and Shell Script execution completed"
else
   echo "VM Creation failed , please check logs"
fi
