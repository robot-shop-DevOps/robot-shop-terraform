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
nat_network_tags            = ["allow-ssh"]

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
vpn_network_tags            = ["allow-ssh"]

firewall_rules = [
    {
        name          = "allow-ssh"
        description   = "Allow SSH traffic"
        network       = "robotshop-sharedntwk-dev-vpc"
        project       = "robotshop-sharedntwk-dev"
        priority      = 1000
        direction     = "INGRESS"
        source_ranges = ["10.50.0.0/24"]
        target_tags   = ["allow-ssh"]

        allow = [
            {
                protocol = "tcp"
                ports    = ["22"]
            }
        ]   
    },
    {
        name          = "allow-icmp"
        description   = "Allow ICMP traffic"
        network       = "robotshop-sharedntwk-dev-vpc"
        project       = "robotshop-sharedntwk-dev"
        priority      = 1001
        direction     = "INGRESS"
        source_ranges = ["10.50.0.0/24"]
        target_tags   = ["allow-icmp"]

        allow = [
            {
                protocol = "icmp"
            }
        ]
    },
    {
        name          = "allow-int-http"
        description   = "Allow Internal HTTP traffic"
        network       = "robotshop-sharedntwk-dev-vpc"
        project       = "robotshop-sharedntwk-dev"
        priority      = 1002
        direction     = "INGRESS"
        source_ranges = ["10.50.0.0/24"]
        target_tags   = ["allow-int-http"]

        allow = [
            {
                protocol = "tcp"
                ports    = ["80"]
            }
        ]
    },
    {
        name          = "allow-int-https"
        description   = "Allow Internal HTTPS traffic"
        network       = "robotshop-sharedntwk-dev-vpc"
        project       = "robotshop-sharedntwk-dev"
        priority      = 1003
        direction     = "INGRESS"
        source_ranges = ["10.50.0.0/24"]
        target_tags   = ["allow-int-https"]

        allow = [
            {
                protocol = "tcp"
                ports    = ["443"]
            }
        ]
    },
    {
        name          = "allow-udp-vpn-server"
        description   = "Allow UDP traffic to VPN Server"
        network       = "robotshop-sharedntwk-dev-vpc"
        project       = "robotshop-sharedntwk-dev"
        priority      = 1003
        direction     = "INGRESS"
        source_ranges = ["0.0.0.0/0"]

        target_service_accounts = ["rbtsntwkdvpn@robotshop-sharedntwk-dev.iam.gserviceaccount.com"]

        allow = [
            {
                protocol = "udp"
                ports    = ["51820"]
            }
        ]
    }
]
