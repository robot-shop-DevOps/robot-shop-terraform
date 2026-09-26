resource "google_compute_region_network_firewall_policy_with_rules" "regional_network_firewall_policy" {
    name        = var.name
    description = var.description
    policy_type = var.policy_type
    region      = var.region
    project     = var.project
    deletion_policy = var.deletion_policy

    dynamic "rule" {
        for_each = var.rules

        content {
            rule_name   = rule.value.rule_name
            description = rule.value.description
            priority    = rule.value.priority
            action      = rule.value.action
            direction   = rule.value.direction
            target_type = rule.value.target_type

            dynamic "target_secure_tag" {
                for_each = rule.value.target_secure_tags

                content {
                    name = target_secure_tag.value
                }
            }

            target_service_accounts = rule.value.target_service_accounts

            match {
                src_ip_ranges  = rule.value.match_src_ip_ranges
                dest_ip_ranges = rule.value.match_dest_ip_ranges

                dynamic "layer4_config" {
                    for_each = rule.value.layer4_configs

                    content {
                        ip_protocol = layer4_config.value.ip_protocol
                        ports       = layer4_config.value.ports
                    }
                }
            }
        }
    } 
}
