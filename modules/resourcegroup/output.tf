output "resource_group_ids" {
  value = { for r in azurerm_resource_group.rg : r.name => r.id }
}

output "rg_names" {
  value = [for r in azurerm_subnet.rg : r.name]
}