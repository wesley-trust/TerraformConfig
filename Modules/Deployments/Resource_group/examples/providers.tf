# Set required providers and versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.29.0"
    }
  }
}

# Configure Providers
provider "azurerm" {
  features {

  }
}