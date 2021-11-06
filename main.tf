#Providers Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.83.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

#Resource Group creation
resource "azurerm_resource_group" "basicrg" {
  name     = "${var.prefix}-basic-rg"
  location = "East US"
  tags = var.tags
}