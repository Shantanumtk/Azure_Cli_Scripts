#config.sh
#Azure Resource Variables 
resource_group=myResourceGroup
resource_location=eastus

vnet_name=project_vnet

vnet_address=10.0.0.0/16

vnet_subnet1=frontend_subnet
vnet_subnet2=backend_subnet

frontend_subnet_address=10.0.1.0/24
backend_subnet_address=10.0.2.0/24

frontend_vmname=frontUbuntuVM
frontend_vmimage=UbuntuLTS
frontend_vmsize=Standard_B1s
frontend_vmstorage=Standard_LRS
frontend_public_ip_sku=Standard
frontend_vmusername=azureuser
frontend_vmpassword=ls987t_rg_vm

backend_vmname=backUbuntuVM
backend_vmimage=UbuntuLTS
backend_vmsize=Standard_B1s
backend_vmstorage=Standard_LRS
backend_public_ip_sku=Standard
backend_vmusername=azureuser
backend_vmpassword=ls987t_rg_vm
