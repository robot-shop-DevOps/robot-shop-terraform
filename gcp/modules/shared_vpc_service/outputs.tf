output "shared_vpc_service_id" {
    description = "Map of Shared VPC Service IDs keyed by host project"
    value       = { for vpc in google_compute_shared_vpc_service_project.shared_vpc_service : vpc.host_project => vpc.id}
}