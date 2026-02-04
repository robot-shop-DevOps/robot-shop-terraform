variable "public_dns_zone" {
    type = list(object({
        name                = string
        resource_group_name = string
        soa_record          = object({
            email         = string
            expire_time   = optional(number)
            minimum_ttl   = optional(number)
            refresh_time  = optional(number)
            retry_time    = optional(number)
            serial_number = optional(number)
            ttl           = optional(number)
            tags          = optional(map(string))
        })
        
        tags = map(string)
    }))
    default = []
}