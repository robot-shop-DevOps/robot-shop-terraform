output "shared_vpc_host_id" {
    description = "Shared VPC Host ID"
    value       = module.shared_vpc_host.shared_vpc_host_id
}

output "shared_vpc_service_id" {
    description = "Map of Shared VPC Service IDs keyed by host project"
    value       = module.shared_vpc_service.shared_vpc_service_id
}

output "vpc_network_id" {
    description = "VPC Network ID"
    value       = module.vpc.vpc_network_id
}

output "subnetwork_ipv4_ids" {
    description = "Map of Subnetwork IPv4 IDs keyed by Subnetwork name"
    value       = module.subnetworks.subnetwork-ipv4-ids
}

output "nat_instance_id" {
    description = "NAT Instance ID"
    value       = module.nat.compute_instance_id
}

output "vpn_instance_id" {
    description = "VPN Instance ID"
    value       = module.vpn.compute_instance_id
}

output "firewall_rule_ids" {
    description = "Map of Firewall Rule IDs keyed by Firewall Rule Name"
    value       = module.firewall_rules.compute_firewall_id
}