variable "mysql_flexible_server" {
    type = list(object({
        name                  = string
        resource_group_name   = string
        location              = string
        administrator_login   = string
        delegated_subnet_name = string
        private_dns_zone_name = string
        sku_name              = string
        tags                  = map(string)
    }))
    default = []
}

variable "subnets" {
    type = map(string)
}

variable "private_dns_zones" {
    type = map(string)
}

variable "key_vault" {
   type = object({
        name                = string
        resource_group_name = string
        secret_name         = list(string)
   })
}