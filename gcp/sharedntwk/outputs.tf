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