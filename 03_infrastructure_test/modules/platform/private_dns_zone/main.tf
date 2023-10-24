locals {
  vnet_id  = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/virtualNetworks/%s", var.vnet_subscription_id, var.vnet_rg_name, var.vnet_name)
}

resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name = "vnet-link-${var.vnet_name}"
  resource_group_name = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
  virtual_network_id = local.vnet_id
}