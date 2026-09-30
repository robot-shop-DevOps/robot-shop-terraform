variable "name" {
  type = string
}

variable "dest_range" {
  type = string
}

variable "network" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "priority" {
  type = string
  default = "1000"
}

variable "project" {
  type = string
  default = "1000"
}

variable "deletion_policy" {
  type    = string
  default = "DELETE"
}

variable "next_hop_gateway" {
  type    = string
  default = null
}

variable "next_hop_instance" {
  type    = string
  default = null
}

variable "next_hop_instance_zone" {
  type    = string
  default = null
}

variable "instance_tags" {
  type    = list(string)
  default = []
}