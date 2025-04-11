resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC-${var.env}"
  }
}

resource "aws_subnet" "subnet" {
  count                   = length(var.subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets[count.index].subnet_cidr
  availability_zone       = var.subnets[count.index].subnet_az
  map_public_ip_on_launch = var.subnets[count.index].public_subnet

  tags = {
    Name = var.subnets[count.index].subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "VPC-${var.env}-igw"
  }
}

resource "aws_route_table" "route_table" {
  count  = var.create_rt ? length(var.route_table) : 0
  vpc_id = var.route_table[count.index].vpc_id

  dynamic "route" {
    for_each = var.route_table[count.index].routes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }

  tags = {
    Name = var.route_table[count.index].name
  }
}

resource "aws_route_table_association" "route_table_association" {
  count          = var.create_rt_association ? length(var.route_table_association) : 0
  route_table_id = var.route_table_association[count.index].route_table_id
  subnet_id      = var.route_table_association[count.index].subnet_id
}