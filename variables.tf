variable "env" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block value"
}

variable "subnets" {
  type = list(object({
    subnet_az     = string
    subnet_name   = string
    subnet_cidr   = string
    public_subnet = bool
  }))
}

variable "create_igw" {
  type        = bool
  description = "whether to create IGW or not"
}

variable "create_rt" {
  type        = bool
  description = "whether to create route table or not"
}

variable "create_rt_association" {
  type        = bool
  description = "whether to create route table association with a subnet or not"
}

variable "route_table" {
  type = list(object({
    vpc_id = string
    routes = optional(list(object({
      cidr_block = string
      gateway_id = optional(string)
    })))
    name = string
  }))
  default = [{
    vpc_id = null
    name   = null
  }]
}

variable "route_table_association" {
  type = list(object({
    route_table_id = string
    subnet_id      = optional(string)
  }))
  default = [{
    route_table_id = null
  }]
}

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

variable "ec2_instances" {
  type = list(object({
    ec2_ami                = string
    ec2_instance_type      = string
    ec2_subnet_id          = string
    ec2_sg                 = list(string)
    ec2_public_ip          = bool
    ec2_user_data          = optional(string)
    ec2_name               = string
    create_key_pair        = bool
    ec2_key_pair_name      = optional(string)
    private_key_algo       = optional(string)
    rsa_bits               = optional(string)
    private_key_location   = optional(string)
    private_key_permission = optional(string)
  }))
}

variable "s3_bucket" {
  type = list(object({
    bucket = optional(string)
    versioning = optional(list(object({
      enabled = bool
    })))
  }))
}