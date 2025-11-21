resource "azurerm_storage_account" "storage_account" {
    for_each = { for sa in var.storage_account: sa.name => sa }

    name                          = each.value.name
    resource_group_name           = each.value.resource_group_name
    location                      = each.value.location
    account_tier                  = each.value.account_tier
    account_replication_type      = each.value.account_replication_type
    access_tier                   = each.value.access_tier
    public_network_access_enabled = each.value.public_network_access_enabled
    tags                          = each.value.tags

    dynamic "network_rules" {
        for_each = each.value.network_rules != null ? [each.value.network_rules] : []

        content {
            default_action             = network_rules.value.default_action
            virtual_network_subnet_ids = try(
                [for sub in network_rules.value.virtual_network_subnets : var.subnet[sub]], null
            )
            ip_rules                   = try(
                network_rules.value.ip_rules, null
            )
        }
    }
}