vnet = [
    {
        name           = "Robot-Shop-Dev"
        location       = "southindia"
        resource_group = "robot-shop"
        address_space  = ["10.0.0.0/16"]
        tags           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

subnet = [
    {
        name             = "DevOps-Tools-Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "Web-Server-Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.2.0/24"]
    },
    {
        name             = "AKS-Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.4.0/24"]
    },
    {
        name             = "Private-Endpoint-Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = [ "10.0.3.0/24" ]
    }
]

public_ip = [
    {
        name                = "Jump-Box-Public-IP"
        location            = "southindia"
        resource_group_name = "robot-shop"
        allocation_method   = "Static"
        sku                 = "Standard"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    },
    {
        name                = "Outbound-Internet-Public-IP"
        location            = "southindia"
        resource_group_name = "robot-shop"
        allocation_method   = "Static"
        sku                 = "Standard"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

network_interface = [
    {
        name                                           = "GitHub-Actions-Server-NIC"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration    = {
            name                          = "GitHub-Actions-Server-IP-Config"
            subnet_name                   = "DevOps-Tools-Subnet"
            private_ip_address_allocation = "Dynamic"
        }
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    },
    {
        name                                           = "Jump-Box-NIC"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration    = {
            name                          = "Jump-Box-IP-Config"
            subnet_name                   = "DevOps-Tools-Subnet"
            private_ip_address_allocation = "Dynamic"
            public_ip_address_name        = "Jump-Box-Public-IP"
        }
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    },
    {
        name                                           = "Outbound-Internet-NIC"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration    = {
            name                          = "Outbound-Internet-IP-Config"
            subnet_name                   = "DevOps-Tools-Subnet"
            private_ip_address_allocation = "Static"
            private_ip_address            = "10.0.1.10"
            public_ip_address_name        = "Outbound-Internet-Public-IP"
        }
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }, 
    {
        name                                           = "Web-Server-NIC"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration    = {
            name                          = "Web-Server-IP-Config"
            subnet_name                   = "Web-Server-Subnet"
            private_ip_address_allocation = "Static"
            private_ip_address            = "10.0.2.10"
        }
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

network_security_group = [
    {
        name                = "GitHub-Actions-Server-NSG"
        location            = "southindia"
        resource_group_name = "robot-shop"
        nic_name            = "GitHub-Actions-Server-NIC"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
        rules               = [
            {
                name                       = "HTTP"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "80"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
            },
            {
                name                       = "HTTPS"
                priority                   = 110
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "443"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
            },
            {
                name                       = "SSH"
                priority                   = 120
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "10.0.1.0/24"
                destination_address_prefix = "*"
            }
        ]
    },
    {
        name                = "Jump-Box-NSG"
        location            = "southindia"
        resource_group_name = "robot-shop"
        nic_name            = "Jump-Box-NIC"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
        rules               = [
            {
                name                       = "SSH"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
            }
        ]
    },
    {
        name                = "Outbound-Internet-NSG"
        location            = "southindia"
        resource_group_name = "robot-shop"
        nic_name            = "Outbound-Internet-NIC"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
        rules               = [
            {
                name                       = "Private-Subent-to-Internet"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "*"
                source_port_range          = "*"
                destination_port_range     = "*"
                source_address_prefix      = "VirtualNetwork"
                destination_address_prefix = "*"
            },
            {
                name                       = "SSH"
                priority                   = 110
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "10.0.1.0/24"
                destination_address_prefix = "*"
            }
        ]
    },
    {
        name                = "Web-Server-NSG"
        location            = "southindia"
        resource_group_name = "robot-shop"
        nic_name            = "Web-Server-NIC"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
        rules               = [
            {
                name                       = "AllowAzureLoadBalancerProbe"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "*"
                source_port_range          = "*"
                destination_port_range     = "80"
                source_address_prefix      = "AzureLoadBalancer"
                destination_address_prefix = "*"
            },
            {
                name                       = "HTTP"
                priority                   = 110
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "80"
                source_address_prefix      = "AzureLoadBalancer"
                destination_address_prefix = "*"
            },
            {
                name                       = "SSH"
                priority                   = 120
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "10.0.1.0/24"
                destination_address_prefix = "*"
            }
        ]
    }
]

route_table = [
    {
        name                = "Web-Server-Subnet-Route-Table"
        location            = "southindia"
        resource_group_name = "robot-shop"
        subnet              = "Web-Server-Subnet"

        tags = {
            environment = "dev"
            project     = "Robot-Shop"
        }

        route = [
            {
                name                   = "Internet"
                address_prefix         = "0.0.0.0/0"
                next_hop_type          = "VirtualAppliance"
                next_hop_in_ip_address = "Outbound-Internet-NIC"
            }
        ]
    },
    {
        name                = "AKS-Subnet-Route-Table"
        location            = "southindia"
        resource_group_name = "robot-shop"
        subnet              = "AKS-Subnet"

        tags = {
            environment = "dev"
            project     = "Robot-Shop"
        }

        route = [
            {
                name                   = "Internet"
                address_prefix         = "0.0.0.0/0"
                next_hop_type          = "VirtualAppliance"
                next_hop_in_ip_address = "Outbound-Internet-NIC"
            }
        ]
    }
]

linux_virtual_machines = [
    {
        name                             = "Github-Actions-Server"
        location                         = "southindia"
        resource_group_name              = "robot-shop"
        size                             = "Standard_B2ms"
        network_interface_names          = [ "GitHub-Actions-Server-NIC" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "GitHub-Actions-Server-osdisk"
        admin_username                   = "GitHubActions"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    },
    {
        name                             = "Jump-Box"
        location                         = "southindia"
        resource_group_name              = "robot-shop"
        size                             = "Standard_B1ms"
        network_interface_names          = [ "Jump-Box-NIC" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Jump-Box-osdisk"
        admin_username                   = "JumpBox"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    },
    {
        name                             = "Outbound-Internet"
        location                         = "southindia"
        resource_group_name              = "robot-shop"
        size                             = "Standard_B1ms"
        network_interface_names          = [ "Outbound-Internet-NIC" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Outbound-Internet-osdisk"
        admin_username                   = "OutboundInternet"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    },
    {
        name                             = "Web-Server"
        location                         = "southindia"
        resource_group_name              = "robot-shop"
        size                             = "Standard_B2ms"
        network_interface_names          = [ "Web-Server-NIC" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Web-Server-osdisk"
        admin_username                   = "WebServer"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    }
]

key_vault = {
    name                = "VMPasswords0205"
    resource_group_name = "robot-shop"
    secret_name         = ["Github-Actions-Server", "Jump-Box", "Outbound-Internet", "Web-Server"]
}

kubernetes_cluster = [
    {
        name                       = "Robot-Shop-Dev-AKS"
        location                   = "southindia"
        resource_group_name        = "robot-shop"

        identity                   = {
            type = "SystemAssigned"
        }

        default_node_pool          = {
            name        = "systemnode"
            node_count  = 1
            vm_size     = "Standard_B2ms"
            subnet_name = "AKS-Subnet"
        }

        dns_prefix                 = "robotshopdevaks"
        private_cluster_enabled    = true

        network_profile            = {
            network_plugin    = "azure"
            network_policy    = "azure"
            load_balancer_sku = "standard"
            outbound_type     = "userDefinedRouting"
            service_cidr      = "10.1.0.0/24"
            dns_service_ip    = "10.1.0.10"
        }

        tags                  = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

kubernetes_node_pool = [
    {
        name                  = "usernodepool"
        kubernetes_cluster    = "Robot-Shop-Dev-AKS"
        vm_size               = "Standard_B2ms"
        vnet_subnet           = "AKS-Subnet"
        node_labels           = {
            environment = "dev"
            project     = "Robot-Shop"
        }

        tags                  = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

container_registry = [
    {
        name                = "robotshopdevacr"
        resource_group_name = "robot-shop"
        location            = "southindia"
        sku                 = "Basic"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

storage_account = [
    {
        name                          = "robotshopdevweb"
        resource_group_name           = "robot-shop"
        location                      = "southindia"
        account_tier                  = "Standard"
        account_replication_type      = "LRS"
        access_tier                   = "Hot"
        public_network_access_enabled = false

        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

storage_container = [
    {
        name                  = "static"
        storage_account       = "robotshopdevweb"
        container_access_type = "private"
    }
]

private_dns_zone = [
    {
        name                = "robotshopdevprivatednszone"
        resource_group_name = "robot-shop"
        virtual_network     = "Robot-Shop-Dev"
        
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

private_endpoint = [
    {
        name                       = "robotshopdevweb-private-endpoint"
        resource_group_name        = "robot-shop"
        location                   = "southindia"
        subnet                     = "Private-Endpoint-Subnet"
        private_service_connection = {
            name                        = "blob-private-endpoint"
            is_manual_connection        = false
            private_connection_resource = "robotshopdevweb"
            subresource_names           = ["blob"]
        }
        private_dns_zone_group     = {
            name                 = "robotshopdevweb-privatednszone"
            private_dns_zone_ids = ["robotshopdevprivatednszone"]
        }

        tags = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]