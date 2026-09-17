output "vpc_network_ids" {
    description = "Map of VPC Network IDs keyed by VPC Network name"
    value       = { for vpc in google_compute_network.vpc_network : vpc.name => vpc.id}
}