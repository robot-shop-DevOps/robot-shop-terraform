variable "private_dns_zone" {
    type = list(object({
        name                = string
        resource_group_name = string
        virtual_network     = string
        tags                = map(string)
    }))
    default = []
}

variable "virtual_networks" {
    type = map(string)
}