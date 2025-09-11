terraform {
    backend "azurerm" {
        resource_group_name  = "Robot-Shop-DevOps"
        storage_account_name = "terraformbackend0205"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}