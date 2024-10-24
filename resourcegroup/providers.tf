terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = "0f406152-f66c-48ab-8849-899264452993"
  features {}
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "tf-str-29"
#     storage_account_name = "tfstrbck29"
#     container_name       = "terraform-state"
#     key                  = "rg.terraform.tfstate"
#   }
# }