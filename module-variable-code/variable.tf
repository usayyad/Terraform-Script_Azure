variable "resource_group" {
    type = object({
      name     = string
      location = string
    })
}

variable "vnet" {
  description = "vnet details"
  type = object({
    vnet_name           = string
    address_spaces      = list(string)
    subnet_prefixes     = list(string)
    subnet_names        = list(string)
  })
}

variable "tags" {
    type  = object({
        Environment = string
        ManagedBy   = string
    })
}

variable "vm" {
  description = "vm details"
  type = object({
    is_windows_image    = bool
    vm_hostname         = string
    admin_username      = string 
    admin_password      = string
    vm_os_simple        = string
    vm_size             = string
    remote_port         = string

    extra_disks = list(object(
        {
          size = number
          name = string
        }
    ))
  })
}