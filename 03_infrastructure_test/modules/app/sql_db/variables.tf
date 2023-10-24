/*
variable "subscription_id" {
  type = string
  description = "Azure Subscription Id"
}
*/
variable "resourcegroup_name" {
  type    = string
  description = " Name of the resource group where the Virtual Machine is to be deployed"
}
variable "sql_servername" {
  type    = string
  description = "SQL Server Name"
}
variable "sql_dbname" {
  type        = string
  description = "SQL Database Name"
}
variable "sqldb_tier" {
  type        = string
  description = "Provide Database tier, allowed values are: Basic, Standard, Premium, GeneralPurpose, Hyperscale, BusinessCritical, null"
  validation {
    condition     = contains(["Basic", "Standard", "Premium", "GeneralPurpose", "Hyperscale", "BusinessCritical"], var.sqldb_tier)
    error_message = "The allowed values for the variable var.sqldb_tier are: Basic, Standard, Premium, GeneralPurpose, Hyperscale, BusinessCritical."
  }
  default = "GeneralPurpose"
}
variable "sku_name" {
  type        = string
  description = "Provide Database SKU"
}

variable "max_size_gb" {
  type    = number
  description = "Maximum size of the Database"
}

variable "la_workspace_id" {
  type = string
  description = "Resource ID of LA workspace"
}

variable "server_id" {
    type = string
    description = "Server ID of SQL Server" 
}
