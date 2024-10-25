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
