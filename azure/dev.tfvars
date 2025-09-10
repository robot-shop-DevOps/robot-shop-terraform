vnet = [
    {
        name           = "robot-shop-vnet"
        location       = "southindia"
        resource_group = "robot-shop"
        address_space  = ["10.0.0.0/16"]
        tags           = {
            environment = "dev"
            project     = "robot-shop"
        }
    }
]

subnet = [
    {
        name             = "public-subnet"
        resource_group   = "robot-shop"
        vnet_name        = "robot-shop-vnet"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "private-subnet"
        resource_group   = "robot-shop"
        vnet_name        = "robot-shop-vnet"
        address_prefixes = ["10.0.2.0/24"]
    }
]

network_interface = [
    {
        name                                           = "robot-shop-public-subnet-nic"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration_name                          = "public-subnet-ip-config"
        ip_configuration_subnet_name                   = "public-subnet"
        ip_configuration_private_ip_address_allocation = "Dynamic"
        tags                                           = {
            environment = "dev"
            project     = "robot-shop"
        }
    },
    {
        name                                           = "robot-shop-private-subnet-nic"
        location                                       = "southindia"
        resource_group_name                            = "robot-shop"
        ip_configuration_name                          = "private-subnet-ip-config"
        ip_configuration_subnet_name                   = "private-subnet"
        ip_configuration_private_ip_address_allocation = "Dynamic"
        tags                                           = {
            environment = "dev"
            project     = "robot-shop"
        }
    }
]

linux_virtual_machines = [
    {
        name                             = "Kubernetes-cluster"
        location                         = "southindia"
        resource_group_name              = "robot-shop"
        size                             = "Standard_D2s_v3"
        network_interface_names          = [ "robot-shop-public-subnet-nic", "robot-shop-private-subnet-nic" ]
        os_disk_caching                  = "ReadWrite"
        os_disk_storage_account_type     = "StandardSSD_LRS"
        os_disk_disk_size_gb             = 30
        admin_username                   = "kubernetes"
        source_image_reference_publisher = "Canonical"
        source_image_reference_offer     = "ubuntu-24_04-lts"
        source_image_reference_sku       = "server"
        source_image_reference_version   = "latest"
    }
]

key_vault = {
    name                = "robot-shop-vm"
    resource_group_name = "robot-shop"
    secret_name         = [ "Kubernetes-cluster" ]
}