#config.sh
#Azure Resource Variables 
resource_group=myResourceGroup
resource_location=eastus

vnet_name=project_vnet

vnet_address=10.0.0.0/16

vnet_subnet1=mqtt_subnet

mqtt_subnet_address=10.0.1.0/24

VM1_vmname=UbuntuVM1
VM1_vmimage=UbuntuLTS
VM1_vmsize=Standard_B1s
VM1_vmstorage=Standard_LRS
VM1_public_ip_sku=Standard
VM1_vmusername=azureuser
VM1_vmpassword=ls987t_rg_vm

VM2_vmname=UbuntuVM2
VM2_vmimage=UbuntuLTS
VM2_vmsize=Standard_B1s
VM2_vmstorage=Standard_LRS
VM2_public_ip_sku=Standard
VM2_vmusername=azureuser
VM2_vmpassword=ls987t_rg_vm
