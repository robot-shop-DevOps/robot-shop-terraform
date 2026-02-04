output "vnet_id" {
    description = "The ID of the Virtual Network"
    value       = module.vnet.vnet_ids
}

output "subnet_id" {
    description = "The ID of the Subnet"
    value       = module.subnet.subnet_ids
}

output "network_interface_id" {
    description = "The ID of the Network Interface"
    value       = module.network_interface.network_interface_ids
}

output "route_table_id" {
    description = "The ID of the Route Table"
    value       = module.route_table.route_table_id
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

output "private_dns_zone_id" {
    description = "The ID of the Private DNS Zone"
    value       = module.private_dns_zone.private_dns_zone_ids
}

output "mysql_flexible_server_id" {
    description = "The ID of the MySQL Server"
    value       = module.mysql_flexible_server.mysql_flexible_server_ids
}

output "mysql_flexible_server_fqdn" {
    description = "The FQDN of the MySQL Server"
    value       = module.mysql_flexible_server.mysql_flexible_server_fqdns
}

output "kubernetes_cluster_id" {
    description = "The ID of the Kubernetes Cluster"
    value       = module.kubernetes_cluster.kubernetes_cluster_ids
}

output "kubernetes_node_pool_id" {
    description = "The ID of the Kubernetes Node Pool"
    value       = module.kubernetes_node_pool.kubernetes_node_pool_ids
}

output "container_registry_id" {
    description = "The ID of the Container Registry"
    value       = module.container_registry.container_registry_ids
}

output "storage_account_id" {
    description = "The ID of the Storage Account"
    value       = module.storage_account.storage_account_id
}

output "storage_account_name" {
    description = "The Name of the Storage Account"
    value       = module.storage_account.storage_account_name
}

output "storage_container_id" {
    description = "The ID of the Storage Container"
    value       = module.storage_container.storage_container_id
}

output "private_endpoint_id" {
    description = "The ID of the Private Endpoint"
    value       = module.private_endpoint.private_endpoint_ids
}

output "public_dns_zone_id" {
    description = "The ID of the Public DNS zone"
    value       = module.public_dns_zone.public_dns_zone_ids
}

output "public_dns_zone_soa_record" {
    description = "The SOA record of the Public DNS zone"
    value       = module.public_dns_zone.public_dns_zone_soa_records
}

output "dns_a_record_id" {
    description = "The ID of the DNS A Record"
    value       = module.dns_a_record.dns_a_record_ids
}

output "dns_txt_record_id" {
    description = "The ID of the DNS TXT Record"
    value       = module.dns_txt_record.dns_txt_record_ids
}

# output "load_balancer_id" {
#     description = "The ID of Load Balancer"
#     value       = module.load_balancer.load_balancer_ids
# }

# output "backend_address_pool_id" {
#     description = "The ID of Backend Address Pool"
#     value       = module.backend_address_pool.backend_address_pool_id
# }