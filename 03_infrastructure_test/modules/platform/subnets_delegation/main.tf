resource "azurerm_subnet" "subnet" {
  name                      = var.subnet_name
  address_prefixes          = var.subnet_addressprefixes
  resource_group_name       = var.rg_name
  virtual_network_name      = var.vnet_name
  delegation {
    name = var.delegation_name
    service_delegation {
      name    = var.svc_delegation_name
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}