output "role_assignment" {
    description = "Map of Role Assignment IDs keyed by Role Assignment Name"
    value       = { for role in azurerm_role_assignment.role_assignment : role.name => role.id }
}