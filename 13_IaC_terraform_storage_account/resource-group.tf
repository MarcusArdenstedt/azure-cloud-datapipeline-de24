resource "azurerm_resource_group" "storage_rg" {
    name = "demo-terraform-rg"
    location = var.location
}