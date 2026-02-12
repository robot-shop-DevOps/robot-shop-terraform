terraform {
    backend "azurerm" {
        resource_group_name  = "robot-shop"
        storage_account_name = "terraformiambackend123"
        container_name       = "statefiles"
        key                  = "terraform.tfstate"
    }
}