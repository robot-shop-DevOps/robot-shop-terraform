resource "azurerm_virtual_network" "vnet" {
    for_each            = { for vnet in var.vnet: vnet.name => vnet }
    name                = each.value.name
    address_space       = each.value.address_space
    location            = each.value.location
    resource_group_name = each.value.resource_group
    tags                = each.value.tags
}