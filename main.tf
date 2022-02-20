terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.90.0"
    }
  }
}

provider "azurerm" {
    features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformStateFiles"
    storage_account_name = "tfstate861929485"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}