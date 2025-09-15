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
}

module "public_ip" {
    source    = "../modules/public_ip"
    public_ip = var.public_ip
}

module "kubernetes_cluster" {
    source             = "../modules/kubernetes_cluster"
    kubernetes_cluster = var.kubernetes_cluster
    subnets            = module.subnet.subnet_ids
}

module "kubernetes_nodes" {
    source              = "../modules/kubernetes_nodes"
    kubernetes_nodes    = var.kubernetes_nodes
    kubernetes_clusters = module.kubernetes_cluster.kubernetes_cluster_ids
    subnets             = module.subnet.subnet_ids
}