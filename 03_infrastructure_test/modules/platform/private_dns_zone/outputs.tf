output "zone_id" {
  value = azurerm_private_dns_zone.dnsprivatezone.id
}

output "zone_name" {
  value = var.private_dns_zone_name
}

output "zone_rg_name" {
  value = var.rg_name 
}