output "vnet_id" {
    description = "The ID of the Virtual Network"
    value       = module.vnet.vnet_id
}

output "vnet_guid" {
    description = "The GUID of the Virtual Network"
    value       = module.vnet.vnet_guid
}