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
    }))
}

variable "network_interface" {
    type = list(object({
        name                                           = string   
        location                                       = string
        resource_group_name                            = string
        ip_configuration_name                          = string
        ip_configuration_subnet_name                   = string
        ip_configuration_private_ip_address_allocation = string
        ip_configuration_public_ip_address_name        = optional(string)
        tags                                           = map(string)
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
        subnet_name         = string
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

variable "kubernetes_cluster" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        
        identity            = object({
            type = string
        })

        default_node_pool = object({
            name        = string
            node_count  = number
            vm_size     = string
            subnet_name = string
        })

        dns_prefix              = string
        private_cluster_enabled = bool

        network_profile         = object({
            network_plugin    = string
            network_policy    = string
            load_balancer_sku = string
            outbound_type     = string
        })
    }))
}

variable "kubernetes_nodes" {
    type = list(object({
        name                    = string
        kubernetes_cluster_name = string
        vm_size                 = string 
        node_count              = number
        subnet_name             = string
    }))
}