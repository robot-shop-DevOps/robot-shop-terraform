resource "azurerm_dns_zone" "public_dns_zone" {
    for_each = length(var.public_dns_zone) > 0 ? {for dns in var.public_dns_zone : dns.name => dns} : {}

    name                = each.value.name
    resource_group_name = each.value.resource_group_name

    soa_record {
        email = each.value.soa_record.email
        expire_time   = try(
            each.value.soa_record.expire_time, null
        )
        minimum_ttl   = try(
            each.value.soa_record.minimum_ttl, null
        )
        refresh_time  = try(
            each.value.soa_record.refresh_time, null
        )
        retry_time    = try(
            each.value.soa_record.refresh_time, null
        )
        serial_number = try(
            each.value.soa_record.serial_number, null
        )
        ttl           = try(
            each.value.soa_record.ttl, null
        )
        tags          = try(
            each.value.soa_record.tags, null
        )
    }
}