resource "google_compute_network" "vpc_network" {
    for_each = {for vpc in var.vpc_network : vpc.name => vpc}

    name                                      = each.value.name
    project                                   = each.value.project
    description                               = try(each.value.description, null)
    auto_create_subnetworks                   = try(each.value.auto_create_subnetworks, null)
    network_firewall_policy_enforcement_order = try(each.value.network_firewall_policy_enforcement_order, null)
    routing_mode                              = try(each.value.routing_mode, null)
    deletion_policy                           = each.value.deletion_policy
}