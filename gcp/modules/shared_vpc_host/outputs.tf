output "shared_vpc_host_id" {
    description = "Map of Shared VPC Host IDs keyed by name"
    value       = { for vpc in google_compute_shared_vpc_host_project.shared_vpc_host : vpc.name => vpc.id}
}