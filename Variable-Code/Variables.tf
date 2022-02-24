variable "resource_group" {
    type = object({  
        name        =   string
        location    =   string
    })
}


variable "vnet" {
    type = object({  
        name             =   string
        address_space    =   list(string)
    })
}

variable "subnet" {
    type = object({  
        name             =   string
        address_prefixes    =   list(string)
    })
}

variable "network_interface" {
    type = object({  
        name             =   string
        ip_config_name   =  string
    })
}

variable "vm_windows" {
    type = object({  
        name                = string
        size                = string
        admin_username      = string
        admin_password      = string
        os_disk = object(
            {
                caching              = string
                storage_account_type = string
                disk_size_gb         = number
            }
        )
        source_image_reference = object(
            {
                publisher = string
                offer     = string
                sku       = string
                version   = string
            }
        )
    })
}

variable "managed_disk" {
    type = object({  
        name                 = string
        storage_account_type = string
        create_option        = string
        disk_size_gb         = number
        lun                  = number
    })
}