output "vnet_id" {
    description = "The ID of the Virtual Network"
    value       = module.vnet.vnet_ids
}

output "vnet_guid" {
    description = "The GUID of the Virtual Network"
    value       = module.vnet.vnet_guids
}

output "subnet_id" {
    description = "The ID of the Subnet"
    value       = module.subnet.subnet_ids
}

output "network_interface_id" {
    description = "The ID of the Network Interface"
    value       = module.network_interface.network_interface_ids
}

output "network_interface_virtual_machine_id" {
    description = "The Virtual Machine ID associated with the Network Interface"
    value       = module.network_interface.network_interface_virtual_machine_ids
}

output "linux_vm_id" {
    description = "The ID of the Linux Virtual Machine"
    value       = module.linux_virtual_machine.linux_vm_ids
}

output "network_security_group_id" {
    description = "The ID of the Network Security Group"
    value       = module.network_security_group.network_security_group_ids
}

output "public_ip_id" {
    description = "The Id of the Public IP"
    value       = module.public_ip.public_ip_ids
}