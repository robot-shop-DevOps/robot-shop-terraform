output "private_endpoint_ids" {
    description = "Map of Private Endpoint IDs keyed by endpoint name"
    value       = { for endpoint in azurerm_private_endpoint.private_endpoint : private_endpoint.name => private_endpoint.id }
}