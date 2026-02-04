output "public_dns_zone_ids" {
    description = "Map of Public DNS Zone IDs keyed by DNS name"
    value       = { for dns in azurerm_dns_zone.public_dns_zone : dns.name => dns.id }
}

output "public_dns_zone_soa_records" {
    description = "Map of Public DNS Zone SOA records keyed by DNS name"
    value       = {
        for dns in azurerm_dns_zone.public_dns_zone :
        dns.name => {
            fqdn      = dns.soa_record[0].fqdn
            host_name = dns.soa_record[0].host_name
        }
    }
}

output "public_dns_zone_names" {
    description = "Map of Public DNS Zone Names keyed by DNS name"
    value       = { for dns in azurerm_dns_zone.public_dns_zone : dns.name => dns.name }
}