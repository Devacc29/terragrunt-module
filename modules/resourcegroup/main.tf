resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups
  name     = each.value["name"]
  location = each.value["location"]
  tags     = each.value["tags"]
}

output "resource_group_ids" {
  value = { for r in azurerm_resource_group.rg : r.name => r.id }
}

output "rg_names" {
  value = [for r in azurerm_resource_group.rg : r.name]
}