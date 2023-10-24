resource "azurerm_private_endpoint" "privateendpoint" {
  name                = "pep-${var.resource_name}"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id
  private_dns_zone_group {
    name = "privatednszonegroup"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name = "pep-${var.resource_name}"
    private_connection_resource_id =  var.resource_id
    subresource_names = [var.subresource_name]
    is_manual_connection = false
  }
}