variable "dns_a_record" {
    type = list(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        records             = optional(list(string))
        target_resource_id  = optional(string)
        tags                = optional(map(string))
    }))
    default = []
}

variable "public_dns_zones" {
    type = map(string)
}