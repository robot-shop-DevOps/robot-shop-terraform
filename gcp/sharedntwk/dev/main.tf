module "shared_vpc_host" {
  source = "../../modules/shared_vpc_host"
  shared_vpc_host = var.shared_vpc_host
}

module "shared_vpc_service" {
  source = "../../modules/shared_vpc_service"
  shared_vpc_service = var.shared_vpc_service
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_network = var.vpc_network
}

module "subnetworks" {
  source          = "../../modules/subnetworks"
  subnetwork-ipv4 = var.subnetwork-ipv4
  vpc_network     = module.vpc.vpc_network_id
}