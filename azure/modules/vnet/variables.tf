variable "vnet" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        tags           = optional(map(string))
    }))
}