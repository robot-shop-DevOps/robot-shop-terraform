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
    value       = module.mysql_flexible_server.mysql_flexible_server_id
}

output "mysql_flexible_server_fqdn" {
    description = "The FQDN of the MySQL Server"
    value       = module.mysql_flexible_server.mysql_flexible_server_fqdn
}

output "kubernetes_cluster_id" {
    description = "The ID of the Kubernetes Cluster"
    value       = module.kubernetes_cluster.kubernetes_cluster_ids
}

output "kubernetes_nodes_id" {
    description = "The ID of the Kubernetes Nodes"
    value       = module.kubernetes_nodes.kubernetes_nodes_ids
}

output "load_balancer_id" {
    description = "The ID of Load Balancer"
    value       = module.load_balancer.load_balancer_ids
}

output "backend_address_pool_id" {
    description = "The ID of Backend Address Pool"
    value       = module.backend_address_pool.backend_address_pool_id
}