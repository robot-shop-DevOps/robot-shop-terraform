variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        vnet_name         = string
        address_prefixes  = list(string)
    }))
}

variable "vnet_names" {
    type = map(string) 
}