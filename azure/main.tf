module "vnet" {
    source = "./modules/vnet"
    vnet   = var.vnet  
}

module "subnet" {
    source     = "./modules/subnet"
    subnet     = var.subnet
    vnet_names = module.vnet.vnet_names
}