output "dns_txt_record_ids" {
    description = "Map of DNS TXT Record IDs keyed by DNS TXT Record name"
    value       = { for txt_record in azurerm_dns_txt_record.dns_txt_record : txt_record.name => txt_record.id }
}