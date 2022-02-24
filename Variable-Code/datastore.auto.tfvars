resource_group = {
    name        =   "example-New-TF-RG"
    location    =   "East US 2"
}

vnet = {
    name                = "New-TF-RG"
    address_space       = ["10.10.0.0/16"]
}

subnet = {
    name                = "internal"
    address_prefixes       = ["10.10.2.0/24"]
}

network_interface = {
    name                = "New-TF-nic"
    ip_config_name      = "internal"
}

vm_windows = {
    name                = "New-TF-EUS2-01"
    size                = "Standard_F2"
    admin_username      = "ap-admin"
    admin_password      = "P@$$w0rd1234!"
        os_disk = {
            caching = "ReadWrite"
            disk_size_gb = 256
            storage_account_type = "Standard_LRS"
        }
        source_image_reference = {
            publisher = "MicrosoftWindowsServer"
            offer     = "WindowsServer"
            sku       = "2019-Datacenter"
            version   = "latest"
        }
}

managed_disk = {
    name                 = "Datadisk1"
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = 10
    lun                  = 10
}
