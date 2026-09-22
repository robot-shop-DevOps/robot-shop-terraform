variable "shared_vpc_host" {
    type = list(object({
        project         = string
        deletion_policy = optional(string, "PREVENT")
    }))
    default = []
}

variable "shared_vpc_service" {
    type = list(object({
        host_project    = string
        service_project = string
    }))
    default = []
}

variable "vpc_network" {
    type = list(object({
        name                    = string
        project                 = string
        description             = optional(string)
        auto_create_subnetworks = optional(bool)
        routing_mode            = optional(string)
        deletion_policy         = optional(string, "PREVENT")
    }))
    default = []
}

variable "subnetwork-ipv4" {
    type = list(object({
        name          = string
        network       = string
        region        = string
        description   = optional(string)
        ip_cidr_range = string
    }))
}

variable "nat_machine_type" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "nat_zone" {
  type = string
}

variable "nat_subnetwork" {
  type = string
}

variable "nat_project" {
  type = string
}

variable "nat_service_account_email" {
  type = string
}

variable "nat_boot_disk_image" {
  type    = string
}

variable "nat_can_ip_forward" {
  type    = bool
  default = false
}

variable "nat_metadata_startup_script" {
  type    = string
  default = ""
}

variable "nat_assign_public_ip" {
  type    = bool
  default = false
}