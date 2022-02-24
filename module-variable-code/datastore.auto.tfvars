resource_group = {
    name     = "tf-lab"
    location = "West Europe"
}

vnet = {
    vnet_name           = "tf-lab"
    address_spaces      = ["10.0.0.0/16"]
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    subnet_names        = ["subnet1", "subnet2", "subnet3"]
}

tags = {
    Environment = "Testing"
    ManagedBy   = "Terraform"
}

vm = {
    is_windows_image    = true
    vm_hostname         = "tf-lab"
    admin_username      = "ap-admin" 
    admin_password      = "ComplxP@ssw0rd!"
    vm_os_simple        = "WindowsServer"
    vm_size             = "Standard_D2s_v3"
    remote_port         = "3389"

    extra_disks = [
        {
          size = 50
          name = "logs"
        },
        {
          size = 200
          name = "backup"
        }
    ]
}