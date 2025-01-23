resource "random_string" "srvid" {
  length  = 6
  upper   = true
  lower   = false
  numeric = true
  special = false
}

resource "azurerm_windows_virtual_machine" "webapp" {
  name                = "${var.project}-${var.environment}-vm"
  computer_name       = "WINSRV-${random_string.srvid.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2ms"
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.webapp.id,
  ]

  os_disk {
    name                 = "${var.project}-${var.environment}-vm-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  license_type = "Windows_Server"
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "webapp" {
  virtual_machine_id = azurerm_windows_virtual_machine.webapp.id
  location           = azurerm_resource_group.rg.location
  enabled            = true

  daily_recurrence_time = "1900"
  timezone              = "UTC"

  notification_settings {
    enabled = false
  }
}

resource "azurerm_network_interface" "webapp" {
  name                = "${var.project}-${var.environment}-vm-nic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webapp.id
  }
}

resource "azurerm_public_ip" "webapp" {
  name                = "${var.project}-${var.environment}-vm-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}