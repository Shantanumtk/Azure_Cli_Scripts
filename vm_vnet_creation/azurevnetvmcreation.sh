#!/bin/bash

#Azure Resource Configuration File
source config.sh

#Resource Creation
echo "Resource Group Creation!!"
az group create --name $resource_group --location $resource_location

#VNET Creation
echo "VNET Creation!!"
az network vnet create -g $resource_group -n $vnet_name --address-prefix $vnet_address

#SUBNET Creation
echo "SUBNET Creation!!"
az network vnet subnet create --address-prefixes $frontend_subnet_address --name $vnet_subnet1 --resource-group $resource_group --vnet-name $vnet_name
az network vnet subnet create --address-prefixes $backend_subnet_address --name $vnet_subnet2 --resource-group $resource_group --vnet-name $vnet_name

#Frontend VM Creation
echo "Frontend VM Creation!!"
az vm create \
    --resource-group $resource_group \
    --name $frontend_vmname \
    --image $frontend_vmimage \
    --storage-sku $frontend_vmstorage \
    --vnet-name $vnet_name \
	--subnet $vnet_subnet1 \
	--size $frontend_vmsize \
    --public-ip-sku $frontend_public_ip_sku \
    --admin-username $frontend_vmusername \
	--admin-password $frontend_vmpassword

#Backend VM Creation
echo "Backend VM Creation!!"
az vm create \
    --resource-group $resource_group \
    --name $backend_vmname \
    --image $backend_vmimage \
    --storage-sku $backend_vmstorage \
    --vnet-name $vnet_name \
	--subnet $vnet_subnet2 \
	--size $backend_vmsize \
    --public-ip-sku $backend_public_ip_sku \
    --admin-username $backend_vmusername \
	--admin-password $backend_vmpassword

