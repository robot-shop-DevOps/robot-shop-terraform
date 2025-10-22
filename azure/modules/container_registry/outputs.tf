output "container_registry_ids" {
    description = "Map of ACR IDs keyed by ACR name"
    value       = { for acr in azurerm_container_registry.DevOps_container_registry : acr.name => acr.id }
}

output "container_registry_login_urls" {
    description = "Map of ACR URLs keyed by ACR name"
    value       = { for acr in azurerm_container_registry.DevOps_container_registry : acr.name => acr.login_server }
}