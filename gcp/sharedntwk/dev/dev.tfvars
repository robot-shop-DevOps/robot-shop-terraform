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

subnetwork-ipv4 = [
    {
        name          = "robotshop-k8s-dev-subnet"
        network       = "robotshop-sharedntwk-dev-vpc"
        region        = "asia-south1"
        description   = "Subnet for Robot Shop Kubernetes Dev"
        ip_cidr_range = "10.0.0.0/24"
    }
]