vnet = [
    {
        name           = "robot-shop-vnet"
        location       = "(Asia Pacific) Central India"
        resource_group = "robot-shop"
        address_space  = ["10.0.0.0/16"]
        subnet         = [
            {
                name             = "public-subnet"
                address_prefixes = ["10.0.1.0/24"]
            },

            {
                name             = "private-subnet"
                address_prefixes = ["10.0.2.0/24"]
            }
        ]
        tags           = {
            environment = "dev"
            project     = "robot-shop"
        }
    }
]