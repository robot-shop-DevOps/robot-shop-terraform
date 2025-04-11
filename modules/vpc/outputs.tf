output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_arn" {
  value = [for s in aws_subnet.subnet : s.arn]
}

output "subnet_id" {
  value = [for s in aws_subnet.subnet : s.id]
}

output "igw_arn" {
  value = [for igw in aws_internet_gateway.igw : igw.arn]
}

output "igw_id" {
  value = [for igw in aws_internet_gateway.igw : igw.id]
}

output "rt_arn" {
  value = [for rt in aws_route_table.route_table : rt.arn]
}

output "rt_id" {
  value = [for rt in aws_route_table.route_table : rt.id]
}

output "rt_association_id" {
  value = [for rt_association in aws_route_table_association.route_table_association : rt_association.id]
}