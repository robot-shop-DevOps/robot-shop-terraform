output "subnet_ids" {
    description = "Map of Subnet IDs keyed by subnet name"
    value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}