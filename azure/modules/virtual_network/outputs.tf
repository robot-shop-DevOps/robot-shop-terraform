output "vnet_names" {
  description = "Map of VNet names keyed by vnet name for dependent modules"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.name }
}

output "vnet_ids" {
  description = "Map of VNet IDs keyed by vnet id"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

output "vnet_guids" {
  description = "Map of VNet GUIDs keyed by vnet guid"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.guid }
}