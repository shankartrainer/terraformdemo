#Bastion NSG creation
resource "azurerm_network_security_group" "bastion-nsg" {
  name                = "${var.prefix}-bastion-nsg"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name

  security_rule {
    name                       = "RDP_Port_Home"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "13.71.66.201"
    destination_address_prefix = "*"
  }
tags = var.tags
}

#Web NSG creation
resource "azurerm_network_security_group" "web-nsg" {
  name                = "${var.prefix}-web-nsg"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name
tags = var.tags
}

#App NSG creation
resource "azurerm_network_security_group" "app-nsg" {
  name                = "${var.prefix}-app-nsg"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name
tags = var.tags
}

#Db NSG creation
resource "azurerm_network_security_group" "db-nsg" {
  name                = "${var.prefix}-db-nsg"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name

  security_rule {
    name                       = "SSH_Port_Home"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "13.71.66.201"
    destination_address_prefix = "*"
  }
tags = var.tags
}

#resource "azurerm_subnet_network_security_group_association" "bastion-nsg-association" {
#  subnet_id                 = azurerm_subnet.bastion.id
# network_security_group_id = azurerm_network_security_group.bastion-nsg.id
#}

resource "azurerm_subnet_network_security_group_association" "web-nsg-association" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-association" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-association" {
  subnet_id                 = azurerm_subnet.db.id
  network_security_group_id = azurerm_network_security_group.db-nsg.id
}
