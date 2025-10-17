output "vnet_names" {
  description = "Map of VNet Names keyed by Vnet Name for dependent modules"
  value       = { for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.name }
}

output "vnet_ids" {
  description = "Map of VNet IDs keyed by Vnet Names"
  value       = { for vnet in azurerm_virtual_network.vnet : vnet.name => vnet.id }
}