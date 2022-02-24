module "network" {
  source              = "Azure/network/azurerm"
  vnet_name           = var.vnet.vnet_name
  resource_group_name = azurerm_resource_group.tflab.name
  address_spaces      = var.vnet.address_spaces
  subnet_prefixes     = var.vnet.subnet_prefixes
  subnet_names        = var.vnet.subnet_names

  tags = {
    Environment = var.tags.Environment
    ManagedBy   = var.tags.ManagedBy
  }

  depends_on = [azurerm_resource_group.tflab]
}