output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = [for id in azurerm_virtual_network.robot_shop_vnet : id.id]
}

output "vnet_guid" {
  description = "The GUID of the Virtual Network"
  value       = [for guid in azurerm_virtual_network.robot_shop_vnet : guid.guid]
}