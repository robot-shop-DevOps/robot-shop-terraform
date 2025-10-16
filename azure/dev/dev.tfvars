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
        name             = "DevOps Tools Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "Web Server Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.2.0/24"]
    },
    {
        name             = "AKS Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.4.0/24"]
    },
    {
        name             = "Data Subnet"
        resource_group   = "robot-shop"
        vnet_name        = "Robot-Shop-Dev"
        address_prefixes = ["10.0.3.0/24"]
        
        delegation = {
            name               = "mysql-flexible-server-delegation"
            service_delegation = {
                name    = "Microsoft.DBforMySQL/flexibleServers"
                actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
            }
        }
    }
]

public_ip = [
    {
        name                = "GitHub-Actions-Server-Public-IP"
        location            = "southindia"
        resource_group_name = "robot-shop"
        allocation_method   = "Dynamic"
        sku                 = "Basic"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    },
    {
        name                = "Jump-Box-Public-IP"
        location            = "southindia"
        resource_group_name = "robot-shop"
        allocation_method   = "Dynamic"
        sku                 = "Basic"
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
    },
    {
        name                = "Web-Server-Public-IP"
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
            subnet_name                   = "DevOps Tools Subnet"
            private_ip_address_allocation = "Dynamic"
            public_ip_address_name        = "GitHub-Actions-Server-Public-IP"
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
            subnet_name                   = "DevOps Tools Subnet"
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
            subnet_name                   = "DevOps Tools Subnet"
            private_ip_address_allocation = "Static"
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
            subnet_name                   = "Web Server Subnet"
            private_ip_address_allocation = "Static"
            public_ip_address_name        = "Web-Server-Public-IP"
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
                priority                   = 100
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
                protocol                   = "Tcp"
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
        subnet              = "Web Server Subnet"

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
        subnet              = "AKS Subnet"

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
    secret_name         = ["Github-Actions-Server", "Jump-Box", "Outbound-Internet", "Web-Server", "robotshopmysqlserver0205"]
}

private_dns_zone = [
    {
        name                = "privatelink.mysql.database.azure.com"
        resource_group_name = "robot-shop"
        virtual_network     = "Robot-Shop-Dev"
        tags = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

mysql_flexible_server = [
    {
        name                  = "robotshopmysqlserver0205"
        resource_group_name   = "robot-shop"
        location              = "southindia"
        administrator_login   = "mysql"
        delegated_subnet_name = "Data Subnet"
        private_dns_zone_name = "privatelink.mysql.database.azure.com"
        sku_name              = "B_Standard_B1ms"

        tags = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

kubernetes_cluster = [
    {
        name                = "robot-shop-aks"
        resource_group_name = "Robot-Shop"
        location            = "southindia"

        identity            = {
            type = "SystemAssigned"
        }

        default_node_pool   = {
            name        = "systemnodes"
            node_count  = 1
            vm_size     = "Standard_B2ms"
            subnet_name = "private-subnet"
        }

        dns_prefix              = "robot-shop-dev"
        private_cluster_enabled = true

        network_profile = {
            network_plugin    = "azure"
            network_policy    = "azure"
            load_balancer_sku = "standard"
            outbound_type     = "loadBalancer"
            service_cidr      = "10.1.0.0/24"
            dns_service_ip    = "10.1.0.10"
        }
    }
]

kubernetes_nodes = [
    {
        name = "workernodes"
        kubernetes_cluster_name = "robot-shop-aks"
        vm_size = "Standard_B2ms"
        node_count = 2
        subnet_name = "private-subnet"
    }
]