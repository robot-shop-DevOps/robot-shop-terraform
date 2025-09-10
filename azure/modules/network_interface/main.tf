resource "azurerm_network_interface" "robot_shop_nic" {
    for_each = { for nic in var.network_interface : nic.name => nic }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
        name                          = each.value.ip_configuration_name
        subnet_id                     = var.subnets[each.value.ip_configuration_subnet_name]
        private_ip_address_allocation = each.value.ip_configuration_private_ip_address_allocation
    }

    tags = each.value.tags
}