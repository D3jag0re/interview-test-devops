variable "resource_name" {
  type    = string
  description = "Name of the resource for which private endpoint has to be enabled"
}
variable "location" {
  type = string
  description = "Location of the resource"
}
variable "rg_name" {
  type = string
  description = "Name of the resource group."
}
variable "subnet_id" {
  type = string
  description = "Subnet resource ID of the Subnet for private endpoint"
}
variable "private_dns_zone_id" {
  type = string
  description = "Private DNS zone resource ID"
}
variable "subresource_name" {
  type = string
  description = "Name of the subresource for private endpoint"
}
variable "resource_id" {
  type = string
  description = "The reosurce id of the resource for which private endpoint has to be enabled"
}