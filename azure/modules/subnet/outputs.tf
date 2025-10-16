output "subnet_ids" {
    description = "Map of Subnet IDs keyed by subnet Name"
    value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
}