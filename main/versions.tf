terraform {
  required_version = ">= 1.11.0"

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = "tfstate"
    key                  = ""
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "78c227db-f22a-40db-9f71-31fdedc8f3c7"
}
