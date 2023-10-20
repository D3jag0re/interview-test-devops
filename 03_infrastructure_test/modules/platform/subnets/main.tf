resource "azurerm_subnet" "subnet" {
  name                      = var.subnet_name
  address_prefixes          = var.subnet_addressprefixes
  resource_group_name       = var.rg_name
  virtual_network_name      = var.vnet_name
}