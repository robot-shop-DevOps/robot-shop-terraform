output "shared_vpc_service_id" {
    description = "Map of Shared VPC Service IDs keyed by name"
    value       = { for vpc in google_compute_shared_vpc_service_project.shared_vpc_service : vpc.name => vpc.id}
}