resource "google_compute_firewall" "firewall" {
    for_each = {
        for rule in var.firewall_rules : rule.name => rule
    }

    name        = each.value.name
    description = each.value.description
    network     = each.value.network
    project     = each.value.project

    priority  = each.value.priority
    direction = each.value.direction
    disabled  = each.value.disabled

    source_ranges           = each.value.source_ranges
    source_tags             = each.value.source_tags
    source_service_accounts = each.value.source_service_accounts

    destination_ranges      = each.value.destination_ranges

    target_tags             = each.value.target_tags
    target_service_accounts = each.value.target_service_accounts

    dynamic "allow" {
        for_each = each.value.allow

        content {
        protocol = allow.value.protocol
        ports    = allow.value.ports
        }
    }

    dynamic "deny" {
        for_each = each.value.deny

        content {
        protocol = deny.value.protocol
        ports    = deny.value.ports
        }
    }
}