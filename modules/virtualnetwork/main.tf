
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