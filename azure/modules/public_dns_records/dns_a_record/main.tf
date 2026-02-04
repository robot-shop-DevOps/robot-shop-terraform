resource "azurerm_dns_a_record" "dns_a_record" {
    for_each = length(var.dns_a_record) > 0 ? { for a_record in var.dns_a_record : a_record.name => a_record } : {}

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    zone_name           = var.public_dns_zones[each.value.zone_name]
    ttl                 = each.value.ttl
    records             = try(
        each.value.records, null
    )
    target_resource_id  = try(
        each.value.target_resource_id, null
    )
    tags                 = try(
        each.value.tags, null
    )
}