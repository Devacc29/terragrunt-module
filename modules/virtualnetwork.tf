variable "resource_group_name" {
  type        = string
  description = "Specifies the name of the resource group in which to create the Azure Network Base Infrastructure Resources."
}


variable "virtual_networks" {
  description = "The virtal networks with their properties."
  type = map(object({
    name          = string
    address_space = list(string)
  }))
  default = {
    vnet1 = {
      name          = "def-test-vnet-01"
      address_space = ["10.10.7.0/21"]
    }
  }
}

variable "subnets" {
  description = "The virtal networks subnets with their properties."
  type = map(object({
    name              = string
    vnet_name         = string
    address_prefixes  = list(string)
    service_endpoints = list(string)
  }))
  default = {
    sub1 = {
      name              = "def-test-vnet-01-sub1"
      vnet_name         = "def-test-vnet-01"
      address_prefixes  = ["10.10.7.0/22"]
      service_endpoints = ["Microsoft.Keyvault"]
    }
  }
}


data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.virtual_networks
  name                = each.value["name"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name
  address_space       = each.value["address_space"]
  tags                = data.azurerm_resource_group.rg.tags
}


resource "azurerm_subnet" "sub" {
  for_each             = var.subnets
  name                 = each.value["name"]
  resource_group_name  = var.resource_group_name
  address_prefixes     = each.value["address_prefixes"]
  service_endpoints    = lookup(each.value, "service_endpoints", null)
  virtual_network_name = each.value["vnet_name"]
  depends_on           = [azurerm_virtual_network.vnet]
}

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