#!/bin/bash

#Azure Resource Configuration File
source config.sh

#Resource Creation
echo "Resource Group Creation!!"
az group create --name $resource_group --location $resource_location

#VNET Creation
echo "VNET Creation!!"
az network vnet create -g $resource_group -n $vnet_name --address-prefix 10.0.0.0/16 \
    --subnet-name $vnet_subnet --subnet-prefix 10.0.1.0/24

