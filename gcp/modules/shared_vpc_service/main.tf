resource "google_compute_shared_vpc_service_project" "shared_vpc_service" {
    for_each = {for vpc in var.shared_vpc_service : vpc.name => vpc}

    host_project    = each.value.host_project
    service_project = each.value.service_project
}