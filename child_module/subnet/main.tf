data "azurerm_subnet" "dtsbnet2608" {
  name                 = var.sbnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

resource "azurerm_subnet" "sbnt260825" {
  name                 = var.sbnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.add_pre
}
