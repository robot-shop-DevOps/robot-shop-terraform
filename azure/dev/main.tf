module "vnet" {
    source = "../modules/virtual_network"
    vnet   = var.vnet  
}

module "subnet" {
    source     = "../modules/subnet"
    subnet     = var.subnet
    vnet_names = module.vnet.vnet_names
}

module "network_interface" {
    source            = "../modules/network_interface"
    subnets           = module.subnet.subnet_ids
    public_ips        = module.public_ip.public_ip_ids
    network_interface = var.network_interface
}

module "route_table" {
    source      = "../modules/route_table"
    route_table = var.route_table
    subnets     = module.subnet.subnet_ids
    network_interfaces = module.network_interface.network_interface_private_ip_address
}

module "linux_virtual_machine" {
    source                 = "../modules/linux_virtual_machine"
    linux_virtual_machines = var.linux_virtual_machines
    network_interfaces     = module.network_interface.network_interface_ids
    key_vault              = var.key_vault
}

module "network_security_group" {
    source                 = "../modules/network_security_group"
    network_security_group = var.network_security_group
    subnets                = module.subnet.subnet_ids
    network_interfaces     = module.network_interface.network_interface_ids
}

module "public_ip" {
    source    = "../modules/public_ip"
    public_ip = var.public_ip
}

module "private_dns_zone" {
    source            = "../modules/private_dns_zone"
    private_dns_zone  = var.private_dns_zone
    virtual_networks  = module.vnet.vnet_ids
}

module "mysql_flexible_server" {
    source                 = "../modules/mysql_flexible_server"
    mysql_flexible_server  = var.mysql_flexible_server
    subnets                = module.subnet.subnet_ids
    private_dns_zones      = module.private_dns_zone.private_dns_zone_ids
    key_vault              = var.key_vault
}

module "kubernetes_cluster" {
    source              = "../modules/kubernetes/cluster"
    kubernetes_cluster  = var.kubernetes_cluster
    subnets             = module.subnet.subnet_ids
}

module "kubernetes_node_pool" {
    source                = "../modules/kubernetes/nodes"
    kubernetes_node_pool  = var.kubernetes_node_pool
    kubernetes_clusters   = module.kubernetes_cluster.kubernetes_cluster_ids
    subnets               = module.subnet.subnet_ids
}

module "container_registry" {
    source              = "../modules/container_registry"
    container_registry  = var.container_registry
}

module "storage_account" {
    source          = "../modules/storage_account"
    storage_account = var.storage_account
    subnet          = module.subnet.subnet_ids
}

module "storage_container" {
    source            = "../modules/storage_container"
    storage_container = var.storage_container
    storage_account   = module.storage_account.storage_account_id
}

module "private_endpoint" {
    source            = "../modules/private_endpoint"
    private_endpoint  = var.private_endpoint
    subnets           = module.subnet.subnet_ids
    private_dns_zones = module.private_dns_zone.private_dns_zone_ids
    storage_account   = module.storage_account.storage_account_id
}

module "public_dns_zone" {
    source          = "../modules/public_dns_zone"
    public_dns_zone = var.public_dns_zone
}

module "dns_a_record" {
    source            = "../modules/public_dns_records/dns_a_record"
    dns_a_record      = var.dns_a_record
    public_dns_zones  = module.public_dns_zone.public_dns_zone_names
    public_ip_address = module.public_ip.public_ip_ids
}

module "dns_txt_record" {
    source           = "../modules/public_dns_records/dns_txt_record"
    dns_txt_record   = var.dns_txt_record
    public_dns_zones = module.public_dns_zone.public_dns_zone_names
}

# module "load_balancer" {
#     source        = "../modules/load_balancer/load_balancer"
#     load_balancer = var.load_balancer
#     public_ips    = module.public_ip.public_ip_ids
# }

# module "load_balancer_backend_address_pool" {
#     source                = "../modules/load_balancer/backend_address_pool"
#     backend_address_pool  = var.backend_address_pool
#     load_balancers        = module.load_balancer.load_balancer_ids
# }