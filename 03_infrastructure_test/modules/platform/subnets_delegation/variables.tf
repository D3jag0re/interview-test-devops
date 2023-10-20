variable "rg_name" {
  type    = string
  description = " Name of the resource group is to be deployed"
}
variable "vnet_name" {
  type    = string
  description = "vnet name."
}
variable "subnet_name" {
  type = string
}
variable "subnet_addressprefixes" {
  type = list(string)
}
variable "delegation_name" {
  type = string
}
variable "svc_delegation_name" {
  type = string
}