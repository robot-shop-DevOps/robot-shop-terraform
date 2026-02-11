resource "azuread_group" "azuread_group" {
    for_each = length(var.azuread_group) > 0 ? { for group in var.azuread_group: group.display_name => group } : {}

    display_name     = each.value.display_name
    description      = try(
        each.value.display_name, null
    )
    security_enabled = each.value.security_enabled
    owners           = try(
        each.value.owners, null
    )
    members          = try(
        each.value.members, null
    )
}