variable "sg" {
  type = list(object({
    sg_name        = string
    sg_description = string
    sg_ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    sg_egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    sg_vpc_id = optional(string)
  }))
}