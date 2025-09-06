resource "azurerm_subnet" "robot_shop_subnet" {
    for_each                = { for subnet in var.subnet: subnet.name => subnet }
    name                 = each.value.name
    resource_group_name  = each.value.resource_group
    virtual_network_name = azurerm_virtual_network.robot_shop_subnet[each.value.vnet_name].name
    address_prefixes     = each.value.address_prefixes 
}