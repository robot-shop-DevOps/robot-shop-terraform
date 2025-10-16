output "network_interface_ids" {
    description = "Map of Network Interface IDs keyed by NIC name"
    value       = { for nic in azurerm_network_interface.nic : nic.name => nic.id }
}

output "network_interface_private_ip_address" {
    description = "Map of Network Interface Private IP Addresses keyed by NIC name"
    value       = { for nic in azurerm_network_interface.nic : nic.name => nic.private_ip_address }
}