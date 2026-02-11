terraform {
  required_providers {
    azurerrd = {
      source  = "hashicorp/azuread"
      version = "=3.7.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.54.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}