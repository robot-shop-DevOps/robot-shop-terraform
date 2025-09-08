module "vpc_subnet" {
  source                  = "./modules/vpc"
  env                     = var.env
  vpc_cidr                = var.vpc_cidr
  subnets                 = var.subnets
  create_igw              = var.create_igw
  create_rt               = var.create_rt
  create_rt_association   = var.create_rt_association
  route_table             = var.route_table
  route_table_association = var.route_table_association
}

module "security_group" {
  source = "./modules/sg"
  sg     = var.sg
}

module "ec2" {
  source        = "./modules/ec2"
  ec2_instances = var.ec2_instances
}

module "s3" {
  source    = "./modules/s3"
  s3_bucket = var.s3_bucket
}