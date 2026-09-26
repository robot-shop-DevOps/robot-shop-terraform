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