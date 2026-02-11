output "azuread_group_ids" {
    description = "Map of Azure AD Group IDs keyed by Azure AD Name"
    value       = { for group in azuread_group.azuread_group : group.display_name => group.object_id }
}