locals {
    scope = {
        subscription       = data.azurerm_subscription.current_subscription.id
        resource_group     = data.azurerm_resource_group.robot-shop.id
        kubernetes_cluster = data.azurerm_kubernetes_cluster.Robot-Shop-Dev-AKS.id
        storage_account    = data.azurerm_storage_account.robotshopdevweb.id
    }
}

locals {
    principal_id = merge(
        module.azuread_group.azuread_group_ids
    )
}