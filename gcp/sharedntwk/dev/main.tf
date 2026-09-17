module "shared_vpc_host" {
  source = "../../modules/shared_vpc_host"
}

module "shared_vpc_service" {
  source = "../../modules/shared_vpc_service"
}