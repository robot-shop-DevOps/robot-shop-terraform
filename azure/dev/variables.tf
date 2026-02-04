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
        tags                             = map(string)
        identity                         = optional(object({
            type = string
        }))
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
    default = []
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
    default = []
}

variable "kubernetes_cluster" {
    type = list(object({
        name                       = string
        location                   = string
        resource_group_name        = string
        
        identity                   = object({
            type = string
        })

        default_node_pool          = object({
            name        = string
            node_count  = number
            vm_size     = string
            subnet_name = string
        })

        dns_prefix                 = optional(string)
        dns_prefix_private_cluster = optional(string)
        private_cluster_enabled    = bool

        network_profile            = object({
            network_plugin      = string
            network_policy      = optional(string)
            network_data_plane  = optional(string)
            network_plugin_mode = optional(string)
            load_balancer_sku   = optional(string)
            outbound_type       = optional(string)
            pod_cidr            = optional(string)
            service_cidr        = optional(string)
            dns_service_ip      = optional(string)
        })

        tags = map(string)
    }))
}

variable "kubernetes_node_pool" {
    type = list(object({
        name               = string
        kubernetes_cluster = string
        vm_size            = string
        node_labels        = optional(map(string))
        node_taints        = optional(list(string))
        vnet_subnet        = string
        tags               = map(string)
    }))
}

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

variable "storage_account" {
    type = list(object({
        name                          = string
        resource_group_name           = string
        location                      = string
        account_tier                  = string
        account_replication_type      = string
        access_tier                   = string
        public_network_access_enabled = bool
        tags                          = map(string)

        network_rules = optional(object({
            default_action          = string
            virtual_network_subnets = optional(list(string))
            ip_rules                = optional(list(string))
        }))
    }))
}

variable "storage_container" {
    type = list(object({
        storage_account       = string
        name                  = string
        container_access_type = string
    }))
}

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
}

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
}

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