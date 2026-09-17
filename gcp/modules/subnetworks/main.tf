resource "google_compute_subnetwork" "subnetwork-ipv4" {
    for_each = {for subnetwork in var.subnetwork-ipv4 : subnetwork.name => subnetwork}

    name          = each.value.name
    network       = var.vpc_network[each.value.network]
    region        = each.value.region
    ip_cidr_range = each.value.ip_cidr_range
    description   = try(each.value.description, null)
}