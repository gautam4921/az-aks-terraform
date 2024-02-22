# Terraform Commands 

# Terraform apply -auto-approve 
# terraform destroy -auto-approve

# terraform state list : Will show what resources has been deployed 
# terraform state show azurerm_resource_group.azterrarg : This command will provide an output for what are the contents inside azterrarg

# terraform show : will show all the tfstate file contents build resources.

# terraform plan -destroy : this command will actually let you know what this will delete 

# terraform apply destroy : this will destroy the whole terraform build 

//When you have stored locally & Remotely  "terraform .tfstate" and some how it got corrupted ,
//there is another file named "terraform.tfstate.backup" which can be renamed to terraform tfstate and can be used 


#To find managed cluster version using azure cli 
# az aks get-versions --location eastus -o table


# Create a service principal
# az ad sp create-for-rbac --name <service_principal_name> --role Contributor --scopes /subscriptions/<subscription_id>
# You can replace the <service-principal-name> with a custom name for your environment or omit the parameter entirely.
# If you omit the parameter, the service principal name is generated based on the current date and time.
#will be used like below 
# az ad sp create-for-rbac --name terraformaz-spn --role Contributor --scopes /subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a

# This will create a contributor role assignment uder the present subscrition 

# output provided below 

#gautam@YG1010056LT:/mnt/d/az-aks-terraform$ az ad sp create-for-rbac --name terraformaz-spn --role Contributor --scopes #/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a
#Creating 'Contributor' role assignment under scope '/subscriptions/90f4dd64-b8a4-40a8-898f-a777acc25b9a'
#The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or #check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
#{
#  "appId": "fc320d5b-cabe-498f-923e-ca6c0b1436ab",
#  "displayName": "terraformaz-spn",
#  "password": "UhX8Q~ArrPlmOT2dEdt.LTaOcLoHSTAyBT7fda.G",
#  "tenant": "62af9dfb-ef59-4700-aee9-03593def1bba"
# }


#How can we use it in terraform 
#This can be used in terraform as below 
 
# make a file providers.tf and paste below code
# Specify service principal credentials in a Terraform provider block


# provider "azurerm" {
#  features{}

#Subscrition_id = "90f4dd64-b8a4-40a8-898f-a777acc25b9a"
#client_id      = "799989c8-2d10-4e66-9c3d-171e83b515f5"
#client_secret  = "UhX8Q~ArrPlmOT2dEdt.LTaOcLoHSTAyBT7fda.G"
#tenant_id      = "62af9dfb-ef59-4700-aee9-03593def1bba"
#}

# terraform {
#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = "=3.0.0"
#    }
#  }
#} 


# How to check wether SP created is working or not :check with a simple terraform resource create 
# you have to logout from your existing login using :"az logout"

# resource "azurerm_resource_group" "azterrarg" {
#  location = "westeurope"
# }