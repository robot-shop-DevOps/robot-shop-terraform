shared_vpc_host = [
    {
        project = "robotshop-sharedntwk-dev"
    }
]

vpc_network = [
    {
        name                    = "robotshop-sharedntwk-dev-vpc"
        project                 = "robotshop-sharedntwk-dev"
        description             = "Shared VPC for Robot Shop Dev"
        auto_create_subnetworks = false
        routing_mode            = "REGIONAL"
    }
]