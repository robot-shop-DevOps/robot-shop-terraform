output "route_table_id" {
    description = "Map of Route Table IDs keyed by Route Table Name"
    value       = { for rt in azurerm_route_table.route_table : rt.name => rt.id }
}