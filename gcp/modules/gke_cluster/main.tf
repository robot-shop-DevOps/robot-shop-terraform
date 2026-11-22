resource "google_container_cluster" "this" {
  project  = var.project_id
  name     = var.cluster_name
  location = var.location

  network    = var.network
  subnetwork = var.subnetwork

  networking_mode = var.networking_mode

  default_max_pods_per_node = var.default_max_pods_per_node

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  datapath_provider = var.datapath_provider

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}
