output "storage_account_id" {
    description = "Map of Storage Account IDs keyed by Storage Account name"
    value       = { for sa in azurerm_storage_account.storage_account : sa.name => sa.id }
}

output "storage_account_name" {
    description = "Map of Storage Account name keyed by Storage Account name"
    value       = { for sa in azurerm_storage_account.storage_account : sa.name => sa.name }
}