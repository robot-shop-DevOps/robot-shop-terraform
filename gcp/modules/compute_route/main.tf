resource "google_compute_route" "route" {
    name                   = var.name
    dest_range             = var.dest_range
    network                = var.network
    description            = var.description
    priority               = var.priority
    project                = var.project
    deletion_policy        = var.deletion_policy
    next_hop_gateway       = var.next_hop_instance != null ? null : var.next_hop_gateway
    next_hop_instance      = var.next_hop_gateway != null ? null : var.next_hop_instance
    next_hop_instance_zone = var.next_hop_instance != null ? var.next_hop_instance_zone : null
}