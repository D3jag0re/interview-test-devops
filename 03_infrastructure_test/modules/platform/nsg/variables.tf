variable "resource_group_name" {
  type    = string
  description = " Name of the resource group where NSG to be deployed."
  default = "rg-poc-01"
}
variable "virtual_network_name" {
  type    = string
  description = "Name of the subnet's virtual network. Required only when subnet_association is set to true"
  default = "vnet-poc-01"
}
variable "subnet_name" {
  type    = string
  description = "Name of the subnet. Required only when subnet_association is set to true"
  default = "default"
}
variable "subnet_association" {
  type    = string
  description = "Set to true if subnet association is required, default is false"
  default     = "false"
}
variable "nsg_name" {
  type    = string
  description = "Name of the nsg to be created."
  default = "example-nsg"
}
variable "nsg_location" {
  type    = string
  description = "Location of the nsg to be created."
  default = "westeurope"
}