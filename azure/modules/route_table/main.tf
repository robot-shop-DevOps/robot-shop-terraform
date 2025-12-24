resource "azurerm_route_table" "route_table" {
    for_each = { for rt in var.route_table : rt.name => rt }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    tags                = each.value.tags

    dynamic "route" {
        for_each = each.value.route != null ? each.value.route : []

        content {
            name                   = route.value.name
            address_prefix         = route.value.address_prefix
            next_hop_type          = route.value.next_hop_type
            next_hop_in_ip_address = try(
                var.network_interfaces[route.value.next_hop_in_ip_address], null
            )
        }
    }
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
    for_each = { for rt in var.route_table : rt.name => rt }

    subnet_id           = var.subnets[each.value.subnet]
    route_table_id      = azurerm_route_table.route_table[each.key].id
}