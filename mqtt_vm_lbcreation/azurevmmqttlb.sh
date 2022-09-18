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
az network vnet subnet create --address-prefixes $mqtt_subnet_address --name $vnet_subnet1 --resource-group $resource_group --vnet-name $vnet_name

#VM1 Creation
echo "Frontend VM Creation!!"
az vm create \
    --resource-group $resource_group \
    --name $VM1_vmname \
    --image $VM1_vmimage \
    --storage-sku $VM1_vmstorage \
    --vnet-name $vnet_name \
	--subnet $vnet_subnet1 \
	--size $VM1_vmsize \
    --public-ip-sku $VM1_public_ip_sku \
    --admin-username $VM1_vmusername \
	--admin-password $VM1_vmpassword

#VM2 Creation
echo "Backend VM Creation!!"
az vm create \
    --resource-group $resource_group \
    --name $VM2_vmname \
    --image $VM2_vmimage \
    --storage-sku $VM2_vmstorage \
    --vnet-name $vnet_name \
	--subnet $vnet_subnet1 \
	--size $VM2_vmsize \
    --public-ip-sku $VM2_public_ip_sku \
    --admin-username $VM2_vmusername \
	--admin-password $VM2_vmpassword

