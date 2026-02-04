variable "dns_txt_record" {
    type = list(object({
        name                = string
        resource_group_name = string
        zone_name           = string
        ttl                 = number
        record              = object({
            value = string
        })
        tags                = optional(map(string))
    }))
    default = []
}

variable "public_dns_zones" {
    type = map(string)
}