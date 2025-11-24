resource "azurerm_private_endpoint" "private_endpoint" {
    for_each = { for endpoint in var.private_endpoint : endpoint.name => endpoint }

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    subnet_id           = var.subnets[each.value.subnet]

    private_service_connection {
        name                              = each.value.private_service_connection.name
        is_manual_connection              = each.value.private_service_connection.is_manual_connection
        private_connection_resource_id    = try(
            var.storage_account[each.value.private_service_connection.private_connection_resource], null
        )
        private_connection_resource_alias = try(
            each.value.private_service_connection.private_connection_resource_alias, null
        )
        subresource_names                 = try(
            each.value.private_service_connection.subresource_names, null
        )
    }

    dynamic "private_dns_zone_group" {
        for_each = each.value.private_dns_zone_group != null ? [each.value.private_dns_zone_group] : []

        content {
            name                 = private_dns_zone_group.value.name
            private_dns_zone_ids = [
                for zone in private_dns_zone_group.value.private_dns_zone_ids : var.private_dns_zones[zone]
            ]
        }
    }

    tags = each.value.tags
}