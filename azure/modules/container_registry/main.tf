resource "azurerm_container_registry" "DevOps_container_registry" {
    for_each = length(var.container_registry) > 0 ? { for acr in var.container_registry : acr.name => acr } : {}

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    sku                 = each.value.sku
    tags                = each.value.tags
}