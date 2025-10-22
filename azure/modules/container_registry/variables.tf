variable "container_registry" {
    type = list(object({
        name                = string
        resource_group_name = string
        location            = string
        sku                 = string
        tags                = map(string)
    }))
    default = []
}