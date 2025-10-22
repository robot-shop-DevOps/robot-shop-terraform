resource "azurerm_private_dns_zone" "private_dns_zone" {
    for_each = length(var.private_dns_zone) > 0 ? { for dns in var.private_dns_zone : dns.name => dns } : {}

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    tags                = each.value.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_link" {
    for_each = { for dns in var.private_dns_zone : dns.name => dns }

    name                  = "${each.value.name}-link"
    resource_group_name   = each.value.resource_group_name
    virtual_network_id    = var.virtual_networks[each.value.virtual_network]
    private_dns_zone_name = each.value.name

    depends_on = [ 
        azurerm_private_dns_zone.private_dns_zone 
    ]
}