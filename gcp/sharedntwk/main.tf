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
  network_tags            = var.nat_network_tags
}

module "vpn" {
  source = "../modules/compute_instance"

  machine_type            = var.vpn_machine_type
  name                    = var.vpn_name
  zone                    = var.vpn_zone
  subnetwork              = var.vpn_subnetwork
  subnetwork_project      = var.vpn_subnetwork_project
  project                 = var.vpn_project
  service_account_email   = var.vpn_service_account_email
  boot_disk_image         = var.vpn_boot_disk_image
  can_ip_forward          = var.vpn_can_ip_forward
  assign_public_ip        = var.vpn_assign_public_ip
  network_tags            = var.vpn_network_tags
}

module "firewall_rules" {
  source         = "../modules/compute_firewall"
  firewall_rules = var.firewall_rules
}
