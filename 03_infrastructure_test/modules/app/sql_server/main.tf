resource "azurerm_mssql_server" "mssql" {
  name                          = var.sql_server_name
  resource_group_name           = var.sql_server_rg_name
  location                      = var.sql_server_location
  version                       = "12.0"
  administrator_login           = var.sql_server_login_name
  administrator_login_password  = var.sql_server_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  identity {
    type = "SystemAssigned"
  }
  azuread_administrator {
    login_username = var.aad_login_username
    object_id      = var.object_id
  }
}