resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"

  tags = merge(
    {
      "Name"        = var.name
      "Environment" = var.environment
    },
    var.tags,
  )
}