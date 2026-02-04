resource "azurerm_dns_txt_record" "dns_txt_record" {
    for_each = length(var.dns_txt_record) > 0 ? { for txt_record in var.dns_txt_record : txt_record.name => txt_record } : {}

    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    zone_name           = var.public_dns_zones[each.value.zone_name]
    ttl                 = each.value.ttl
    tags                = try(
        each.value.tags, null
    )

    record {
        value = each.value.record.value
    }
}