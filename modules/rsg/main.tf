resource "azurerm_resource_group" "rsg" {
  name     = var.name
  location = var.location

  tags = merge(
    {
      "Name"        = var.name
      "Environment" = var.environment
    },
    var.tags,
  )
}