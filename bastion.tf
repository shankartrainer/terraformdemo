resource "azurerm_public_ip" "bastion-pip" {
  name                = "${var.prefix}-bastion-pip"
  resource_group_name = azurerm_resource_group.basicrg.name
  location            = azurerm_resource_group.basicrg.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_network_interface" "bastionnic" {
  name                = "${var.prefix}-bastion-nic"
  location            = azurerm_resource_group.basicrg.location
  resource_group_name = azurerm_resource_group.basicrg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.bastion.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion-pip.id
  }
tags = var.tags
}


resource "azurerm_windows_virtual_machine" "bastion-vm" {
  name                = "bastion-vm"
  resource_group_name = azurerm_resource_group.basicrg.name
  location            = azurerm_resource_group.basicrg.location
  size                = var.vm_size
  admin_username      = "azureuser"
  admin_password      = "password@123"
  network_interface_ids = [
    azurerm_network_interface.bastionnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  tags = var.tags
}
