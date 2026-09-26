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
nat_metadata_startup_script = "scripts/nat.sh"
nat_assign_public_ip        = true

vpn_machine_type            = "e2-micro"
vpn_name                    = "rbtsntwkdvpn"
vpn_zone                    = "asia-south1-a"
vpn_project                 = "robotshop-sharedntwk-dev"
vpn_subnetwork              = "robotshop-sharedntwk-dev-subnet"
vpn_subnetwork_project      = "robotshop-sharedntwk-dev"
vpn_service_account_email   = "rbtsntwkdvpn@robotshop-sharedntwk-dev.iam.gserviceaccount.com"
vpn_boot_disk_image         = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-amd64"
vpn_can_ip_forward          = true
vpn_assign_public_ip        = true

asia_south1_firewall_policy_name        = "rbtsntwkdfwpolicy"
asia_south1_firewall_policy_description = "Firewall Policy for Robot Shop Dev"
asia_south1_firewall_policy_region      = "asia-south1"
asia_south1_firewall_policy_project     = "robotshop-sharedntwk-dev"
asia_south1_firewall_policy_rules = [
    {
        rule_name                 = "allow-ssh"
        description               = "Allow SSH traffic"
        priority                  = 1000
        action                    = "allow"
        direction                 = "INGRESS"
        target_secure_tags        = ["allow-ssh"]
        match_src_ip_ranges       = ["10.50.0.0/24"]

        layer4_configs          = [
            {
                ip_protocol = "tcp"
                ports       = ["22"]
            }
        ]
    },
    {
        rule_name                 = "allow-icmp"
        description               = "Allow ICMP traffic"
        priority                  = 1001
        action                    = "allow"
        direction                 = "INGRESS"
        target_secure_tags        = ["allow-icmp"]
        match_src_ip_ranges       = ["10.50.0.0/24"]

        layer4_configs          = [
            {
                ip_protocol = "icmp"
            }
        ]
    },
    {
        rule_name                 = "allow-http"
        description               = "Allow HTTP traffic"
        priority                  = 1002
        action                    = "allow"
        direction                 = "INGRESS"
        target_secure_tags        = ["allow-http"]
        match_src_ip_ranges       = ["10.50.0.0/24"]

        layer4_configs          = [
            {
                ip_protocol = "tcp"
                ports       = ["80"]
            }
        ]
    },
    {
        rule_name                 = "allow-https"
        description               = "Allow HTTPS traffic"
        priority                  = 1003
        action                    = "allow"
        direction                 = "INGRESS"
        target_secure_tags        = ["allow-https"]
        match_src_ip_ranges       = ["10.50.0.0/24"]

        layer4_configs          = [
            {
                ip_protocol = "tcp"
                ports       = ["443"]
            }
        ]
    }
]
