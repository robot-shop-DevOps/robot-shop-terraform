output "vpc_arn" {
  value = module.vpc_subnet.vpc_arn
}

output "vpc_id" {
  value = module.vpc_subnet.vpc_id
}

output "subnet_arn" {
  value = module.vpc_subnet.subnet_arn
}

output "subnet_id" {
  value = module.vpc_subnet.subnet_id
}

output "igw_arn" {
  value = module.vpc_subnet.igw_arn
}

output "igw_id" {
  value = module.vpc_subnet.igw_id
}

output "sg_arn" {
  value = module.security_group.sg_arn
}

output "sg_id" {
  value = module.security_group.sg_id
}

output "rt_arn" {
  value = module.vpc_subnet.rt_arn
}

output "rt_id" {
  value = module.vpc_subnet.rt_id
}

output "rt_association_id" {
  value = module.vpc_subnet.rt_association_id
}