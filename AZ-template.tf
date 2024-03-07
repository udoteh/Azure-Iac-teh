terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.0"
    }
  }
}
# configure the Microsoft Azure Provider
provider "azurerm" {
    skip_provider_registration = true 
    features{}
}

# create a resource group
resource "azurerm_resource_group" "example" {
  name = "example-resources"
  location = "canada central"
}

# create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
    name = "example-network"
    resource_group_name = azurerm_resource_group.example
    location = azurerm_resource_group.example.location
    address_space = ["10.0.0.0/16"]
  
}