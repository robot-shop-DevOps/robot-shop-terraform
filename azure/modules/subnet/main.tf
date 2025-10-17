resource "azurerm_subnet" "subnet" {
    for_each             = { for subnet in var.subnet: subnet.name => subnet }
    name                 = each.value.name
    resource_group_name  = each.value.resource_group
    virtual_network_name = var.vnet_names[each.value.vnet_name]
    address_prefixes     = each.value.address_prefixes 
    service_endpoints = try(
        each.value.service_endpoints, null
    )

    dynamic "delegation" {
        for_each = each.value.delegation != null ? [each.value.delegation] : []

        content {
            name = delegation.value.name

            service_delegation {
                name    = delegation.value.service_delegation.name
                actions = delegation.value.service_delegation.actions
            }
        }
    }
}