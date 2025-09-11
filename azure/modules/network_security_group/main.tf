resource "azurerm_network_security_group" "robot_shop_nsg" {
    for_each = { for nsg in var.network_security_group : nsg.name => nsg }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    tags                = each.value.tags
}

resource "azurerm_network_security_rule" "robot_shop_nsg_rule" {
    for_each = { for rule in local.nsg_rules : rule.key => rule }

    name                        = each.value.rule.name
    priority                    = each.value.rule.priority
    direction                   = each.value.rule.direction
    access                      = each.value.rule.access
    protocol                    = each.value.rule.protocol
    source_port_range           = each.value.rule.source_port_range
    destination_port_range      = each.value.rule.destination_port_range
    source_address_prefix       = each.value.rule.source_address_prefix
    destination_address_prefix  = each.value.rule.destination_address_prefix
    resource_group_name         = each.value.resource_group_name
    network_security_group_name = azurerm_network_security_group.robot_shop_nsg[each.value.nsg_name].name
}

resource "azurerm_subnet_network_security_group_association" "robot_shop_nsg_association" {
    for_each = { for association in var.network_security_group : association.name => association }

    subnet_id                 = var.subnets[each.value.subnet_name]
    network_security_group_id = azurerm_network_security_group.robot_shop_nsg[each.key].id
}