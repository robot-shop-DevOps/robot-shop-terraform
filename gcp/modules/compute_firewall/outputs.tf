output "compute_firewall_id" {
  description = "Map of Firewall Rule IDs keyed by Firewall Rule Name"
  value       = { for firewall in google_compute_firewall.firewall : firewall.name => firewall.id }
}