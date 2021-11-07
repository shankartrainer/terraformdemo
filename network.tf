#Virtual Network and Subnet creation
resource "azurerm_virtual_network" "basicvnet" {
  name                = "${var.environment}-${var.virtual_network}"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name
  address_space       = var.vnet_prefix
tags = var.tags

}

#Bastion subnet creation
resource "azurerm_subnet" "bastion" {
  name                 = "${var.environment}-${var.bastion_subnet}"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = var.bastion_prefix
}

#web subnet creation
resource "azurerm_subnet" "web" {
  name                 = "${var.environment}-${var.web_subnet}"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = var.web_prefix
}

#app subnet creation
resource "azurerm_subnet" "app" {
  name                 = "${var.environment}-${var.app_subnet}"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = var.app_prefix
}

#db subnet creation
resource "azurerm_subnet" "db" {
  name                 = "${var.environment}-${var.db_subnet}"
  resource_group_name  = azurerm_resource_group.basicrg.name
  virtual_network_name = azurerm_virtual_network.basicvnet.name
  address_prefixes     = var.db_prefix
}