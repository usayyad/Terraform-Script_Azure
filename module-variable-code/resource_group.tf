resource "azurerm_resource_group" "tflab" {
  name     = var.resource_group.name
  location = var.resource_group.location
}