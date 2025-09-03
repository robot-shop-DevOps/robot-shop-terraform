variable "env" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr" {
  description = "value for cidr block of VPC"
  default     = "10.0.0.16"
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