variable "public_ip" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        allocation_method   = string
        sku                 = string
        tags                = map(string)
    }))
}