terraform {
  backend "azurerm" {
    resource_group_name  = "Az-eastus"
    storage_account_name = "azeastusdiag"
    container_name       = "akstfstate01"
    key                  = "terraform.tfstate"
  }
}