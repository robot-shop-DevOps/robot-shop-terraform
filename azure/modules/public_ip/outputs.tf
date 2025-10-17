output "public_ip_ids" {
    description = "Map of Public IP IDs keyed by Public IP name"
    value = { for ip in azurerm_public_ip.public_ip : ip.name => ip.id }
}