variable "private_endpoint" {
    type = list(object({
        name                       = string
        resource_group_name        = string
        location                   = string
        subnet                     = string
        private_service_connection = object({
            name                              = string
            is_manual_connection              = bool
            private_connection_resource       = optional(string)
            private_connection_resource_alias = optional(string)
            subresource_names                 = optional(list(string))
        })
        private_dns_zone_group     = optional(object({
            name                 = string
            private_dns_zone_ids = list(string)
        }))

        tags = map(string)
    }))
}

variable "subnets" {
    type = map(string)
}

variable "private_dns_zones" {
    type = map(string)
}

variable "storage_account" {
    type = map(string)
}