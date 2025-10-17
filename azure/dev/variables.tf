variable "vnet" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        tags           = optional(map(string))
    }))
}

variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        vnet_name         = string
        address_prefixes  = list(string)
        service_endpoints = optional(list(string))

        delegation        = optional(object({
            name               = string
            service_delegation = object({
                name    = string
                actions = list(string)
            })
        }))
    }))
}

variable "network_interface" {
    type = list(object({
        name                                           = string   
        location                                       = string
        resource_group_name                            = string
        ip_configuration    = object({
            name                          = string
            subnet_name                   = string
            private_ip_address_allocation = string
            private_ip_address            = optional(string)
            public_ip_address_name        = optional(string)        
        })
        tags                                           = map(string)
    }))
}

variable "route_table" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        subnet              = string
        tags                = map(string)
        route               = optional(list(object({
            name                   = string
            address_prefix         = string
            next_hop_type          = string
            next_hop_in_ip_address = optional(string)
        })))
    }))
}

variable "linux_virtual_machines" {
    type = list(object({
        name                             = string
        location                         = string
        resource_group_name              = string
        size                             = string
        network_interface_names          = list(string)
        os_disk_caching                  = string
        os_disk_storage_account_type     = string
        os_disk_disk_size_gb             = optional(number)
        os_disk_name                     = optional(string)  
        admin_username                   = string
        zone                             = optional(string)
        source_image_reference_publisher = string
        source_image_reference_offer     = string
        source_image_reference_sku       = string
        source_image_reference_version   = string
    }))
}

variable "key_vault" {
   type = object({
        name = string
        resource_group_name = string
        secret_name = list(string)
   })
}

variable "network_security_group" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        tags                = map(string)
        subnet_name         = optional(string)
        nic_name            = optional(string)
        rules               = list(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        }))
    }))
}

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

variable "private_dns_zone" {
    type = list(object({
        name                = string
        resource_group_name = string
        virtual_network     = string
        tags                = map(string)
    }))
}

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
}

# variable "load_balancer" {
#     type = list(object({
#         name                = string
#         resource_group_name = string
#         location            = string
#         sku                 = string
#         tags                = map(string)

#         frontend_ip_configuration = object({
#             name                 = string
#             public_ip_address_id = string
#         })
#     }))
# }

# variable "backend_address_pool" {
#     type = list(object({
#         name         = string
#         loadbalancer = string
#     }))
# }