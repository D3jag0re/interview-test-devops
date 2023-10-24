terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
  backend "azurerm" {
    resource_group_name = ""
    storage_account_name = ""
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = true 
  features {}
}