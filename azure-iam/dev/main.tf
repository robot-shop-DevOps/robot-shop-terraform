module "azuread_group" {
    source        = "../modules/azuread_group"
    azuread_group = var.azuread_group
}

module "role_assignment" {
    source          = "../modules/role_assignment"
    role_assignment = var.role_assignment
    scope           = local.scope
    principal_id    = local.principal_id
}