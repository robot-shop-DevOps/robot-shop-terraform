output "shared_vpc_host_id" {
    description = "Shared VPC Host ID"
    value       = module.shared_vpc_host.shared_vpc_host_id
}

output "shared_vpc_service_id" {
    description = "Shared VPC Service ID"
    value       = module.shared_vpc_service.shared_vpc_service_id
}