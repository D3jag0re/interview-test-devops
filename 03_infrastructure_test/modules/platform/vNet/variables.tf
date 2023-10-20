variable "vnet_name" {
  type    = string
  description = "vnet name."
}
variable "vnet_location" {
  type    = string
  description = "location of vnet resource to deploy."
  default     = "westeurope"
}
variable "rg_name" {
  type    = string
  description = " Name of the resource group is to be deployed"
}
variable "vnet_addressprefixes" {
  type = list(string)
  description = "Vnet Address Space range will specify here."
  default     = ["10.0.0.0/16"]
}
variable "custom_dns" {
  type    = string
  description = "To Associate Vnet with custom DNS values."
  validation {
    condition     = contains(["true", "True", "TRUE", "false", "False", "FALSE"], var.custom_dns)
    error_message = "Valid values for var.custom_dns: are one of true, True, TRUE, false, False, FALSE."
  }
}
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}