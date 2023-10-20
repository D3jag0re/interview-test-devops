variable "rg_name" {
  type    = string
  description = " Name of the resource group is to be deployed"
  default     = "rg-test"
}

variable "rg_location" {
  description = "The location/region to keep all your resources."
  default     = "westeurope"
}

variable "tags" {
  description = "A list of public subnets inside the vNet."
  type        = any
}