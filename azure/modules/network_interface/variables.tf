variable "network_interface" {
    type = list(object({
        name                                           = string   
        location                                       = string
        resource_group_name                            = string
        ip_configuration_name                          = string
        ip_configuration_subnet_name                   = string
        ip_configuration_private_ip_address_allocation = string
        ip_configuration_public_ip_address_name        = optional(string)
        tags                                           = map(string)
    }))
}

variable "subnets" {
    type = map(string)
}

variable "public_ips" {
    type = map(string)
}