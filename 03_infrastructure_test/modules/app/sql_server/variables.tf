variable "sql_server_rg_name" {
  type    = string
  description = "Name of the Resource Group where the SQL Server must be deployed."
}
variable "sql_server_name" {
  type = string
  description = "Name of the SQL Server that should be created under the target resource group."
}
variable "sql_server_location" {
  type = string
  description = "Name of the region where SQL Server needs to be deployed."
  default     = "westeurope"
}
variable "sql_server_login_name" {
  type = string
  description = "Username for the SQL Server like for example adminsqlsver."
}
variable "sql_server_password" {
  type = string
  description = "Password for the SQL Server."
}
variable "aad_login_username" {
  type = string
  description = "AAD admin login username."
}
variable "object_id" {
  type = string
  description = "AAD admin login object id."
}