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