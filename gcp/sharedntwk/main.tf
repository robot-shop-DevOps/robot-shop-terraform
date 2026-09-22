module "shared_vpc_host" {
  source = "../modules/shared_vpc_host"
  shared_vpc_host = var.shared_vpc_host
}

module "shared_vpc_service" {
  source = "../modules/shared_vpc_service"
  shared_vpc_service = var.shared_vpc_service
}

module "vpc" {
  source = "../modules/vpc"
  vpc_network = var.vpc_network
}

module "subnetworks" {
  source          = "../modules/subnetworks"
  subnetwork-ipv4 = var.subnetwork-ipv4
  vpc_network     = module.vpc.vpc_network_id
}

module "nat" {
  source = "../modules/compute_instance"

  machine_type            = var.nat_machine_type
  name                    = var.nat_name
  zone                    = var.nat_zone
  subnetwork              = var.nat_subnetwork
  subnetwork_project      = var.nat_subnetwork_project
  project                 = var.nat_project
  service_account_email   = var.nat_service_account_email
  boot_disk_image         = var.nat_boot_disk_image
  can_ip_forward          = var.nat_can_ip_forward
  metadata_startup_script = file(var.nat_metadata_startup_script)
  assign_public_ip        = var.nat_assign_public_ip
}