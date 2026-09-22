shared_vpc_host = [
    {
        project = "robotshop-sharedntwk-dev"
    }
]

shared_vpc_service = [
    {
        host_project    = "robotshop-sharedntwk-dev"
        service_project = "robotshop-k8s-dev"
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
    },

    {
        name          = "robotshop-sharedntwk-dev-subnet"
        network       = "robotshop-sharedntwk-dev-vpc"
        region        = "asia-south1"
        description   = "Subnet for Robot Shop Shared Network Dev"
        ip_cidr_range = "10.1.0.0/24"
    }
]

nat_machine_type            = "e2-micro"
nat_name                    = "rbtsntwkdnat"
nat_zone                    = "asia-south1-a"
nat_project                 = "robotshop-sharedntwk-dev"
nat_subnetwork              = "robotshop-sharedntwk-dev-subnet"
nat_subnetwork_project      = "robotshop-sharedntwk-dev"
nat_service_account_email   = "rbtsntwkdnat@robotshop-sharedntwk-dev.iam.gserviceaccount.com"
nat_boot_disk_image         = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-amd64"
nat_can_ip_forward          = true
nat_metadata_startup_script = "../scripts/nat.sh"
nat_assign_public_ip        = true