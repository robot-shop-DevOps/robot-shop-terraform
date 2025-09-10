variable "network_security_group" {
    type = list(object({
        name = string
        location = string
        resource_group_name = string
        tags = map(string)
        subnet_name = string
        rules = list(object({
            name = string
            priority = number
            direction = string
            access = string
            protocol = string
            source_port_range = string
            destination_port_range = string
            source_address_prefix = string
            destination_address_prefix = string
        }))
    }))
}

variable "subnets" {
    type = map(string)
}