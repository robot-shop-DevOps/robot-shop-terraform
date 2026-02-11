output "azuread_group_id" {
    description = "The ID of the Azure AD Group"
    value       = module.azuread_group.azuread_group_ids
}

output "role_assignment_id" {
    description = "The ID of the Role Assignment"
    value       = module.role_assignment.role_assignment_ids
}