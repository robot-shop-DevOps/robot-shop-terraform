module "k3s_controlplane" {
  source = "../../modules/compute_instance"

  machine_type          = var.k3s_controlplane_machine_type
  name                  = var.k3s_controlplane_name
  zone                  = var.k3s_controlplane_zone
  subnetwork            = var.k3s_controlplane_subnetwork
  subnetwork_project    = var.k3s_controlplane_subnetwork_project
  project               = var.k3s_controlplane_project
  service_account_email = var.k3s_controlplane_service_account_email
  boot_disk_image       = var.k3s_controlplane_boot_disk_image
}