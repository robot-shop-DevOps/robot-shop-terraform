output "shared_vpc_host_id" {
    description = "Shared VPC Host ID"
    value       = module.shared_vpc_host.shared_vpc_host_id
}

output "vpc_network_id" {
    description = "VPC Network ID"
    value       = module.vpc.vpc_network_id
}