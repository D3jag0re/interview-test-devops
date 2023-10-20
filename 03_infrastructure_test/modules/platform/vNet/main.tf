resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_addressprefixes
  dns_servers         = (length(compact(var.dns_servers)) > 0) && ((lower(var.custom_dns) == "true") ) ? var.dns_servers : null
}