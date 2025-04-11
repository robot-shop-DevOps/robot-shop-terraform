resource "aws_security_group" "security_group" {
  count       = length(var.sg)
  description = var.sg[count.index].sg_description

  dynamic "ingress" {
    for_each = var.sg[count.index].sg_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.sg[count.index].sg_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  vpc_id = var.sg[count.index].sg_vpc_id

  tags = {
    Name = var.sg[count.index].sg_name
  }
}