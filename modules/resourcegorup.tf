variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

  default = {
    rg = {
      name     = "def-tf-aceo-rg-01"
      location = "eastus2"
      tags = {
        env        = "test"
        created_by = "deva"
      }
    }
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups
  name     = each.value["name"]
  location = each.value["location"]
  tags     = each.value["tags"]
}

output "resource_group_ids" {
  value = { for r in azurerm_resource_group.rg : r.name => r.id }
}