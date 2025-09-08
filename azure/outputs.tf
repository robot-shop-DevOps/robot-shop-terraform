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