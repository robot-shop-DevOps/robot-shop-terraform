output "network_firewall_policy_id" {
  description = "Network Firewall Policy ID"
  value       = google_compute_region_network_firewall_policy_with_rules.regional_network_firewall_policy.id
}