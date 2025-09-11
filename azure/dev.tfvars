vnet = [
    {
        name           = "Robot-Shop-VNet"
        location       = "eastus"
        resource_group = "Robot-Shop-DevOps"
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
        resource_group   = "Robot-Shop-DevOps"
        vnet_name        = "Robot-Shop-VNet"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "private-subnet"
        resource_group   = "Robot-Shop-DevOps"
        vnet_name        = "Robot-Shop-VNet"
        address_prefixes = ["10.0.2.0/24"]
    }
]

network_security_group = [
    {
        name                = "public-subnet-nsg"
        location            = "eastus"
        resource_group_name = "Robot-Shop-DevOps"
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
                protocol                   = "TCP"
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
                protocol                   = "TCP"
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
                protocol                   = "TCP"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "*"
                destination_address_prefix = "10.0.1.0/24"
            }
        ]
    },
    {
        name                = "private-subnet-nsg"
        location            = "eastus"
        resource_group_name = "Robot-Shop-DevOps"
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
                protocol                   = "TCP"
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
        name                = "robot-shop-public-ip"
        location            = "eastus"
        resource_group_name = "Robot-Shop-DevOps"
        allocation_method   = "Dynamic"
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

network_interface = [
    {
        name                                           = "public-subnet-nic"
        location                                       = "eastus"
        resource_group_name                            = "Robot-Shop-DevOps"
        ip_configuration_name                          = "external-traffic"
        ip_configuration_subnet_name                   = "public-subnet"
        ip_configuration_private_ip_address_allocation = "Dynamic"
        ip_configuration_public_ip_address_name        = "robot-shop-public-ip"
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    },
    {
        name                                           = "private-subnet-nic"
        location                                       = "eastus"
        resource_group_name                            = "Robot-Shop-DevOps"
        ip_configuration_name                          = "internal-traffic"
        ip_configuration_subnet_name                   = "private-subnet"
        ip_configuration_private_ip_address_allocation = "Dynamic"
        tags                                           = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

linux_virtual_machines = [
    {
        name                             = "Kubernetes-ControlPlane-WorkerNode1"
        location                         = "eastus"
        resource_group_name              = "Robot-Shop-DevOps"
        size                             = "Standard_B2s_v2"
        network_interface_names          = [ "public-subnet-nic" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Kubernetes-ControlPlane-WorkerNode1-osdisk"
        admin_username                   = "kubernetes"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    }, 
    {
        name                             = "Kubernetes-WorkerNode2"
        location                         = "eastus"
        resource_group_name              = "Robot-Shop-DevOps"
        size                             = "Standard_B2s_v2"
        network_interface_names          = [ "public-subnet-nic" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Kubernetes-WorkerNode2-osdisk"
        admin_username                   = "kubernetes"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    },
    {
        name                             = "Kubernetes-WorkerNode3"
        location                         = "eastus"
        resource_group_name              = "Robot-Shop-DevOps"
        size                             = "Standard_B2s_v2"
        network_interface_names          = [ "private-subnet-nic" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        os_disk_name                     = "Kubernetes-WorkerNode3-osdisk"
        admin_username                   = "kubernetes"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    },
    {
        name                             = "Jump-Box"
        location                         = "eastus"
        resource_group_name              = "Robot-Shop-DevOps"
        size                             = "Standard_B1ls"
        network_interface_names          = [ "public-subnet-nic" ]
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
    resource_group_name = "Robot-Shop-DevOps"
    secret_name         = [ "Kubernetes-ControlPlane-WorkerNode1", "Kubernetes-WorkerNode2", "Kubernetes-WorkerNode3", "Jump-Box" ]
}