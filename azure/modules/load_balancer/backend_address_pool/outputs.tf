output "backend_address_pool_ids" {
    description = "Map of Backend Address Pool IDs keyed by Backend Address Pool name"
    value       = { for lb in azurerm_lb_backend_address_pool.DevOps_backend_address_pool : lb.name => lb.id }
}