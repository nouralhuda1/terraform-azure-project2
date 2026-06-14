output "aci_ip" {
  value = azurerm_container_group.aci.ip_address
}

output "aci_fqdn" {
  value = azurerm_container_group.aci.fqdn
}

output "resource_group" {
  value = azurerm_resource_group.rg.name
}
