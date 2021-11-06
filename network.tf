#Virtual Network and Subnet creation
resource "azurerm_virtual_network" "basicvnet" {
  name                = "${var.prefix}-virtualNetwork1"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name
  address_space       = ["10.20.0.0/16"]
tags = var.tags

}

#Bastion subnet creation
resource "azurerm_subnet" "bastion" {
  name                 = "${var.prefix}-bastion"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = ["10.20.1.0/24"]
}

#web subnet creation
resource "azurerm_subnet" "web" {
  name                 = "${var.prefix}-web"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = ["10.20.2.0/24"]
}

#app subnet creation
resource "azurerm_subnet" "app" {
  name                 = "${var.prefix}-app"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = ["10.20.3.0/24"]
}

#db subnet creation
resource "azurerm_subnet" "db" {
  name                 = "${var.prefix}-db"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = ["10.20.4.0/24"]
}