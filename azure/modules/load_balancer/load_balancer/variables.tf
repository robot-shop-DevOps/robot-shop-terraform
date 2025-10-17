variable "load_balancer" {
    type = list(object({
        name                = string
        resource_group_name = string
        location            = string
        sku                 = string
        tags                = map(string)

        frontend_ip_configuration = object({
            name                 = string
            public_ip_address_id = string
        })
    }))
}

variable "public_ips" {
    type = map(string)
}