variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "policy_type" {
  type    = string
  default = "VPC_POLICY"
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "deletion_policy" {
  type    = string
  default = "PREVENT"
}

variable "rules" {
  type = list(object({
    rule_name               = string
    description             = optional(string, "")
    priority                = number
    action                  = string
    direction               = string
    target_secure_tags      = optional(list(string), [])
    target_service_accounts = optional(list(string), [])
    target_type             = optional(string, "INSTANCES")
    match_src_ip_ranges     = optional(list(string), [])
    match_dest_ip_ranges    = optional(list(string), [])
    layer4_configs          = optional(list(object({
      ip_protocol = string
      ports       = optional(list(string), [])
    })), 
    [])
  }))
}