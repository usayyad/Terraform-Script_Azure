module "windowsservers" {
  depends_on          = [azurerm_resource_group.tflab, module.network.vnet_name]
  source              = "Azure/compute/azurerm"
  count               = 3
  resource_group_name = azurerm_resource_group.tflab.name
  is_windows_image    = var.vm.is_windows_image
  vm_hostname         = "${var.vm.vm_hostname}-${count.index}"
  admin_username      = var.vm.admin_username
  admin_password      = var.vm.admin_password
  vm_os_simple        = var.vm.vm_os_simple
  vm_size             = var.vm.vm_size
  remote_port         = var.vm.remote_port
  vnet_subnet_id      = module.network.vnet_subnets[0]

  extra_disks = var.vm.extra_disks
}