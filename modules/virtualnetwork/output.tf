output "vnet_name" {
  value = [for v in azurerm_virtual_network.vnet : v.name]
}

output "vnet_ids" {
  value = { for v in azurerm_virtual_network.vnet : v.name => v.id }
}

output "snet_names" {
  value = [for s in azurerm_subnet.sub : s.name]
}

output "snet_ids" {
  value = { for s in azurerm_subnet.sub : s.name => s.id }
}

output "snet_id" {
  value = [for s in azurerm_subnet.sub : s.id ]
}