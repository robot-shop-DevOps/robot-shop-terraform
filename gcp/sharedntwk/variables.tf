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

variable "nat_subnetwork_project" {
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

variable "vpn_machine_type" {
  type = string
}

variable "vpn_name" {
  type = string
}

variable "vpn_zone" {
  type = string
}

variable "vpn_subnetwork_project" {
  type = string
}

variable "vpn_subnetwork" {
  type = string
}

variable "vpn_project" {
  type = string
}

variable "vpn_service_account_email" {
  type = string
}

variable "vpn_boot_disk_image" {
  type    = string
}

variable "vpn_can_ip_forward" {
  type    = bool
  default = false
}

variable "vpn_assign_public_ip" {
  type    = bool
  default = false
}

variable "firewall_rules" {
  type = list(object({
    name        = string
    description = optional(string, "")
    network     = string
    project     = string

    priority  = optional(number, 1000)
    direction = optional(string, "INGRESS")
    disabled  = optional(bool, false)

    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string), [])
    source_service_accounts = optional(list(string), [])

    destination_ranges      = optional(list(string), [])
    target_tags             = optional(list(string), [])
    target_service_accounts = optional(list(string), [])

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string), [])
    })), [])

    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string), [])
    })), [])

    log_config = optional(object({
      metadata = string
    }), null)
  }))
}

variable "asia_south1_firewall_policy_name" {
  type = string
}

variable "asia_south1_firewall_policy_description" {
  type    = string
  default = ""
}

variable "asia_south1_firewall_policy_region" {
  type = string
}

variable "asia_south1_firewall_policy_project" {
  type = string
}

variable "asia_south1_firewall_policy_rules" {
  type = list(object({
    rule_name               = string
    description             = optional(string, "")
    priority                = number
    action                  = string
    direction               = string
    target_secure_tags      = optional(list(string), [])
    target_service_accounts = optional(list(string), [])
    match_src_ip_ranges     = optional(list(string), [])
    match_dest_ip_ranges    = optional(list(string), [])
    layer4_configs          = optional(list(object({
      ip_protocol = string
      ports       = optional(list(string), [])
    })), 
    [])
  }))
}