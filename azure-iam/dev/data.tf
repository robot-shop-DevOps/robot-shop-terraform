data "azurerm_subscription" "current_subscription" {}

data "azurerm_resource_group" "robot-shop" {
  name = "robot-shop"
}

data "azurerm_kubernetes_cluster" "Robot-Shop-Dev-AKS" {
  name                = "Robot-Shop-Dev-AKS"
  resource_group_name = "robot-shop"
}

data "azurerm_storage_account" "robotshopdevweb" {
  name                = "robotshopdevweb"
  resource_group_name = "robot-shop"
}