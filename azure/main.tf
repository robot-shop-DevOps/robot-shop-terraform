module "vnet" {
    source = "./modules/virtual_network"
    vnet   = var.vnet  
}

module "subnet" {
    source     = "./modules/subnet"
    subnet     = var.subnet
    vnet_names = module.vnet.vnet_names
}

module "network_interface" {
    source            = "./modules/network_interface"
    subnets           = module.subnet.subnet_ids
    network_interface = var.network_interface
}

module "linux_virtual_machine" {
    source                 = "./modules/linux_virtual_machine"
    linux_virtual_machines = var.linux_virtual_machines
    network_interfaces     = module.network_interface.network_interface_ids
    key_vault              = var.key_vault
}

module "network_security_group" {
    source                 = "./modules/network_security_group"
    network_security_group = var.network_security_group
    subnets                = module.subnet.subnet_ids
}