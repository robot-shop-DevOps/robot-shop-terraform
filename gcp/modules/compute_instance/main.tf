resource "google_compute_instance" "compute_instance" {
    name         = var.name
    project      = var.project
    zone         = var.zone
    machine_type = var.machine_type
    description  = var.description
    hostname     = var.hostname

    network_interface {
        subnetwork         = var.subnetwork
        subnetwork_project = var.subnetwork_project
    }

    service_account {
        email  = var.service_account_email
        scopes = var.service_account_scopes
    }

    boot_disk {
        initialize_params {
            image = var.boot_disk_image
            type  = var.boot_disk_type
            size  = var.boot_disk_size
        }
        auto_delete = var.boot_disk_auto_delete
    }
}
