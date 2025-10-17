variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        vnet_name         = string
        address_prefixes  = list(string)
        service_endpoints = optional(list(string))

        delegation        = optional(object({
            name               = string
            service_delegation = object({
                name    = string
                actions = list(string)
            })
        }))
    }))
}

variable "vnet_names" {
    type = map(string) 
}