output "role_assignment_ids" {
    description = "Map of Role Assignment IDs keyed by Role Assignment Name"
     value = {
        for k, role in azurerm_role_assignment.role_assignment :
        k => role.id
    }
}