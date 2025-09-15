vnet = [
    {
        name           = "Robot-Shop-VNet"
        location       = "southindia"
        resource_group = "Robot-Shop"
        address_space  = ["10.0.0.0/16"]
        tags           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

subnet = [
    {
        name             = "public-subnet"
        resource_group   = "Robot-Shop"
        vnet_name        = "Robot-Shop-VNet"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "private-subnet"
        resource_group   = "Robot-Shop"
        vnet_name        = "Robot-Shop-VNet"
        address_prefixes = ["10.0.2.0/24"]
    }
]

network_security_group = [
    {
        name                = "public-subnet-nsg"
        location            = "southindia"
        resource_group_name = "Robot-Shop"
        subnet_name         = "public-subnet"
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
                destination_address_prefix = "10.0.1.0/24"
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
                destination_address_prefix = "10.0.1.0/24"
            },
            {
                name                       = "SSH"
                priority                   = 120
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "*"
                destination_address_prefix = "10.0.1.0/24"
            }
        ]
    },
    {
        name                = "private-subnet-nsg"
        location            = "southindia"
        resource_group_name = "Robot-Shop"
        subnet_name         = "private-subnet"
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
                source_address_prefix      = "10.0.1.0/24"
                destination_address_prefix = "10.0.2.0/24"
            }
        ]
    }  
]

public_ip = [
    {
        name                = "public-subnet-nic-jumpbox-public-ip"
        location            = "southindia"
        resource_group_name = "Robot-Shop"
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
        name                                           = "public-subnet-nic-jumpbox"
        location                                       = "southindia"
        resource_group_name                            = "Robot-Shop"
        ip_configuration_name                          = "external-traffic"
        ip_configuration_subnet_name                   = "public-subnet"
        ip_configuration_private_ip_address_allocation = "Dynamic"
        ip_configuration_public_ip_address_name        = "public-subnet-nic-jumpbox-public-ip"
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

linux_virtual_machines = [
    {
        name                             = "Jump-Box"
        location                         = "southindia"
        resource_group_name              = "Robot-Shop"
        size                             = "Standard_A1_v2"
        network_interface_names          = [ "public-subnet-nic-jumpbox" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 10
        os_disk_name                     = "Jump-Box-osdisk"
        admin_username                   = "kubernetes"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    }
]

key_vault = {
    name                = "robot-shop-keyValut"
    resource_group_name = "Robot-Shop"
    secret_name         = [ "Kubernetes-ControlPlane-WorkerNode1", "Kubernetes-WorkerNode2", "Kubernetes-WorkerNode3", "Jump-Box" ]
}

kubernetes_cluster = [
    {
        name                = "robot-shop-aks"
        resource_group_name = "Robot-Shop"
        location            = "southindia"

        identity            = {
            type = "SystemAssigned"
        }

        default_node_pool   = {
            name        = "systemnodepool"
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
        }
    }
]

kubernetes_nodes = [
    {
        name = "workernodepool"
        kubernetes_cluster_name = "robot-shop-aks"
        vm_size = "Standard_B2ms"
        node_count = 2
        subnet_name = "private-subnet"
    }
]