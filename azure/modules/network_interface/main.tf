resource "azurerm_network_interface" "nic" {
    for_each = { for nic in var.network_interface : nic.name => nic }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
        name                          = each.value.ip_configuration.name
        subnet_id                     = var.subnets[each.value.ip_configuration.subnet_name]
        private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
        private_ip_address            = try(
            each.value.ip_configuration.private_ip_address, null
        )
        public_ip_address_id          = try(
            var.public_ips[each.value.ip_configuration.public_ip_address_name], null
        )
    }

    tags = each.value.tags
}