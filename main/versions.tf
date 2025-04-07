terraform {
  required_version = ">= 1.11.0"

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
