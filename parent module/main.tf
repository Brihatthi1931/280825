module "res26" {
    source = "../child_module/rerource_group"
    rg_name = "rsg260825"
    rg_location = "East US"
}

# Virtual Network
module "vnet26" {
    depends_on = [ module.res26 ]
    source = "../child_module/vnet"
    vnet_name = "vnet2608"
    add_spc = ["10.0.0.0/16"]
    rg_name = "rsg260825"
    rg_location = "East US"
}

# Subnet
module "sbnet26" {
    depends_on = [ module.vnet26 ]
    source = "../child_module/subnet"
    sbnet_name = "sbnt2608"
    vnet_name = "vnet2608"
    rg_name = "rsg260825"
    add_pre = ["10.0.1.0/24"]
}

# Network Security Group
module "nsg26" {
    depends_on = [ module.res26 ]
    source = "../child_module/nsg"
    nsg_name = "nsg260825"
    rg_name = "rsg260825"
    rg_location = "East US"
}