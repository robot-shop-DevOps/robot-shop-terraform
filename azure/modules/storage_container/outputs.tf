output "storage_container_id" {
    description = "Map of Storage Container IDs keyed by Storage Container name"
    value       = { for sc in azurerm_storage_container.DevOps_storage_container : sc.name => sc.id }
}