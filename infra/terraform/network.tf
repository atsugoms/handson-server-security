# ---------------------------------------------
# Virtual Netrowk
# ---------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project}-${var.environment}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/8"]
}


# ---------------------------------------------
# Virtual Netrowk - Subnet
# ---------------------------------------------
resource "azurerm_subnet" "default" {
  name                 = "default-snet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

# ---------------------------------------------
# Netrowk Security Group
# ---------------------------------------------
resource "azurerm_network_security_group" "default" {
  name                = "${var.project}-${var.environment}-vnet-default-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "AllowAnyRDPInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    protocol                   = "Tcp"
    destination_port_range     = "3389"
  }
}
