output "private_dns_zone_ids" {
    description = "Map of Private DNS Zone IDs keyed by DNS name"
    value       = { for dns in azurerm_private_dns_zone.private_dns_zone : dns.name => dns.id }
}