resource "azurerm_public_ip" "web-pip" {
  name                = "${var.environment}-web-pip"
  resource_group_name = azurerm_resource_group.basicrg.name
  location            = azurerm_resource_group.basicrg.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_network_interface" "webnic" {
  name                = "${var.environment}-web-nic"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web-pip.id
  }
tags = var.tags
}


resource "azurerm_linux_virtual_machine" "web-vm" {
  name                = "${var.environment}-${var.webvm_name}"
  resource_group_name = azurerm_resource_group.basicrg.name
  location            = azurerm_resource_group.basicrg.location
  size                = var.linux_vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.webnic.id,
  ]

   admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = var.tags
}
