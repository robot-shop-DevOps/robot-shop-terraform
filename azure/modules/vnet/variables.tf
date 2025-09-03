variable "vnet" {
    type = list(objects({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        subnet         = optional(list(object({
            name = string
            address_prefix = list(string)
        })))
        tags           = optional(map)
    }))
}