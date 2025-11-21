resource "azurerm_storage_container" "storage_container" {
    for_each = { for sc in var.storage_container : sc.name => sc }

    storage_account_id    = var.storage_account[each.value.storage_account]
    name                  = each.value.name
    container_access_type = each.value.container_access_type
}