output "subnetwork-ipv4-ids" {
    description = "Map of Subnetwork IPv4 IDs keyed by Subnetwork name"
    value       = { for subnetwork in google_compute_subnetwork.subnetwork-ipv4 : subnetwork.name => subnetwork.id}
}