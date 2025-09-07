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