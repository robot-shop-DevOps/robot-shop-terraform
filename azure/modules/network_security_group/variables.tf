variable "network_security_group" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        tags                = map(string)
        subnet_name         = optional(string)
        nic_name            = optional(string)
        rules               = list(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        }))
    }))
}

locals {
    nsg_rules = flatten([
        for nsg in var.network_security_group : [
            for rule in nsg.rules : {
                key                 = "${nsg.name}-${rule.name}"
                rule                = rule
                nsg_name            = nsg.name
                resource_group_name = nsg.resource_group_name
            }
        ]
    ])
}

variable "subnets" {
    type = map(string)
}

variable "network_interfaces" {
    type = map(string)
}