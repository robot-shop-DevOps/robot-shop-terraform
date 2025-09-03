terraform {
    backend "azurerm" {
        resource_group_name  = "robot-shop"
        storage_account_name = "terraformbackend0205"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}