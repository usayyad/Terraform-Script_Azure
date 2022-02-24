
resource "azurerm_resource_group" "example" {
  name     = var.resource_group.name
  location = var.resource_group.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet.name
  address_space       = var.vnet.address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet.name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet.address_prefixes
}

/*resource "azurerm_subnet" "Int2" {
  name                 = "internal-2"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.10.3.0/24"]
} */

resource "azurerm_network_interface" "example" {
  name                = var.network_interface.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = var.network_interface.ip_config_name
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
  
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_windows.name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.vm_windows.size
  admin_username      = var.vm_windows.admin_username
  admin_password      = var.vm_windows.admin_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = var.vm_windows.os_disk.caching
    storage_account_type = var.vm_windows.os_disk.storage_account_type
    disk_size_gb         = var.vm_windows.os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.vm_windows.source_image_reference.publisher
    offer     = var.vm_windows.source_image_reference.offer
    sku       = var.vm_windows.source_image_reference.sku
    version   = var.vm_windows.source_image_reference.version
  }
}

resource "azurerm_managed_disk" "example" {
  name                 = var.managed_disk.name
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = var.managed_disk.storage_account_type
  create_option        = var.managed_disk.create_option
  disk_size_gb         = var.managed_disk.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_windows_virtual_machine.example.id
  lun                = var.managed_disk.lun
  caching            = var.vm_windows.os_disk.caching
}
