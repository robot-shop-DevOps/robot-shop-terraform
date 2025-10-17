output "load_balancer_ids" {
    description = "Map of Load Balancer IDs keyed by Load Balancer name"
    value       = { for lb in azurerm_lb.load_balancer : lb.name => lb.id }
}