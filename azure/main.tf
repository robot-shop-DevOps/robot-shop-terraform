module "vnet" {
    source = "./modules/vnet"
    vnet   = var.vnet  
}

module "subnet" {
    source = "./modules/subnet"
    subnet = var.subnet
}