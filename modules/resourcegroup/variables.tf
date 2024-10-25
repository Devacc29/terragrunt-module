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