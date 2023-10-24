output "sql_server_id" {
  value = azurerm_mssql_server.mssql.id
}

output "sql_server_name" {
  value = var.sql_server_name 
}