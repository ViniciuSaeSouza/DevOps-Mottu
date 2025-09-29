#!/bin/bash
resourceGroup="rg-prisma"
location="brazilsouth"
vmName="vm-mottu"
vmSize="Standard_B1s"
urn="Ubuntu2204"
adminUser="admprisma"
adminPassword="PrismaCode@3" 

az group create --name $resourceGroup --location $location

az vm create \
--resource-group $resourceGroup \
--name $vmName \
--image $urn \
--admin-username $adminUser \
--admin-password "$adminPassword" \
--size $vmSize \
--authentication-type password

PORTAS=(80 8080 443 5432)
PRIORIDADE=1001
for porta in "${PORTAS[@]}"
do
	aZ vm open-port	\
	--resource-group $resourceGroup \
	--name $vmName \
	--port $porta \
	--priority $PRIORIDADE
	((PRIORIDADE++))
done
echo "VM criada com sucesso!"
echo "Nome: $vmName"
echo "IP Público: $(az vm show -g $resourceGroup -n $vmName --show-details --query 'publicIps' -o tsv)"
echo "Usuário: $adminUser"