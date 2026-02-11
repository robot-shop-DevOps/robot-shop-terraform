resource "azurerm_role_assignment" "role_assignment" {
    for_each = length(var.role_assignment) > 0 ? { for role in var.role_assignment: role.name => role } : {}

    scope                = var.scope[each.value.scope]
    principal_id         = var.principal_id[each.value.principal_id]
    name                 = each.value.name
    principal_type       = try(
        each.value.principal_type, null
    )
    description          = try(
        each.value.description, null
    )
    role_definition_id   = try(
        each.value.role_definition_id, null
    )
    role_definition_name = try(
        each.value.role_definition_name, null
    )
    condition            = try(
        each.value.condition, null
    )
}