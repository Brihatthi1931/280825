data "azurerm_subnet" "dtsbnet2608" {
  name                 = var.sbnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

resource "azurerm_network_security_group" "nsg260825" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "random" {
    subnet_id = data.azurerm_subnet.dtsbnet2608.id
    network_security_group_id = azurerm_network_security_group.nsg260825.id
}