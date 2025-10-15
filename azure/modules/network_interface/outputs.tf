output "network_interface_ids" {
    description = "Map of Network Interface IDs keyed by NIC name"
    value       = { for k, v in azurerm_network_interface.nic : k => v.id }
}

output "network_interface_virtual_machine_ids" {
    description = "Map of Network Interface Virtual Machine IDs keyed by NIC name"
    value       = { for k, v in azurerm_network_interface.nic : k => v.virtual_machine_id }
}