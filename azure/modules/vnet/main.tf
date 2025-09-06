resource "azurerm_virtual_network" "robot_shop_vnet" {
    count               = length(var.vnet)
    name                = var.vnet[count.index].name
    address_space       = var.vnet[count.index].address_space
    location            = var.vnet[count.index].location
    resource_group_name = var.vnet[count.index].resource_group
    tags                = var.vnet[count.index].tags

    dynamic "subnet" {
        for_each = var.vnet[count.index].subnet
        content {
            name             = subnet.value.name
            address_prefixes = subnet.value.address_prefixes
        }
    }
}