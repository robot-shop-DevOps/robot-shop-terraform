module "shared_vpc_host" {
  source = "../../modules/shared_vpc_host"
  shared_vpc_host = var.shared_vpc_host
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_network = var.vpc_network
}

module "subnetwork" {
  source = "../../modules/subnetwork"
  subnetwork_ipv4 = var.subnetwork-ipv4
  vpc_network = module.vpc.vpc_network_id
}