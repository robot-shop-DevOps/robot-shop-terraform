variable "vnet" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        subnet         = optional(list(object({
            name = string
            address_prefixes = list(string)
        })))
        tags           = optional(map)
    }))
}