variable "route_table" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        subnet              = string
        tags                = map(string)
        route               = optional(list(object({
            name                   = string
            address_prefix         = string
            next_hop_type          = string
            next_hop_in_ip_address = optional(string)
        })))
    }))
}

variable "network_interfaces" {
    type = map(string)
}

variable "subnets" {
    type = map(string)
}