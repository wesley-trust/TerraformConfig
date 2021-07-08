# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Set required providers and versions
terraform {
  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.29.0"
    }
  }
}
