variable "vnet" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        tags           = optional(map(string))
    }))
}

variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        vnet_name         = string
        address_prefixes  = list(string)
    }))
}