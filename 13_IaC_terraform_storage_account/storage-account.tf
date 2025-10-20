resource "azurerm_storage_account" "my_storage_account" {
  name = "demostorageaccount${random_string.suffix.result}"
  account_tier = "Standard"
  location = var.location
  resource_group_name = azurerm_resource_group.storage_rg.name
  account_replication_type = "LRS"

  tags = { environment= "staging"}
}

resource "azurerm_storage_container" "csv_container" {
  name = "demo-terraform-youtube-analytics"
  storage_account_id = azurerm_storage_account.my_storage_account.id
  container_access_type = "private"
}


resource "azurerm_storage_blob" "upload_csv" {
  name = "Totalt.csv"
  storage_account_name = azurerm_storage_account.my_storage_account.name
  storage_container_name = azurerm_storage_container.csv_container.name
  source = "data/Totalt.csv"
  type = "Block"
}