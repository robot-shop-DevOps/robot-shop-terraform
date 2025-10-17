output "network_security_group_ids" {
    description = "Map of Network Security Group IDs keyed by NSG name"
    value = { for nsg in azurerm_network_security_group.nsg : nsg.name => nsg.id }
}