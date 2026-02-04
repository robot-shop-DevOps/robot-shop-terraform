output "dns_a_record_ids" {
    description = "Map of DNS A Record IDs keyed by DNS A Record name"
    value       = { for a_record in azurerm_dns_a_record.dns_a_record : a_record.name => a_record.id }
}