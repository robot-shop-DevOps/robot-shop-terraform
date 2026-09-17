resource "google_compute_shared_vpc_host_project" "shared_vpc_host" {
    for_each = {for vpc in var.shared_vpc_host : vpc.project => vpc}

    project = each.value.project
}