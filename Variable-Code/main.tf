terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    
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