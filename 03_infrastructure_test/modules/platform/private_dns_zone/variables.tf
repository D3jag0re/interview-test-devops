variable "private_dns_zone_name" {
  type    = string
  description = "Name of the Private DNS zone"
}
variable "rg_name" {
  type = string
  description = "Name of the resource group."
}
variable "vnet_subscription_id" {
  type = string
  description = "Subscription ID of the VNet to be linked"
}
variable "vnet_rg_name" {
  type = string
  description = "Name of the resource group of VNet"
}
variable "vnet_name" {
  type = string
  description = "Name of the VNet to be linked"
}