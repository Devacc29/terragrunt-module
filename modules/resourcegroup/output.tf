output "resource_group_ids" {
  value = { for r in azurerm_resource_group.rg : r.name => r.id }
}