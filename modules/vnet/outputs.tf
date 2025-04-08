output "vnet_id" {
  value       = azurerm_virtual_network.this.id
  description = "ID of the VNet"
}
output "vnet_name" {
  value       = azurerm_virtual_network.this.name
  description = "Name of the VNet"
}
output "vnet_address_space" {
  value       = azurerm_virtual_network.this.address_space
  description = "Address space of the VNet"
}

output "public_subnet_ids" {
  value       = { for k, v in azurerm_subnet.public : k => v.id }
  description = "IDs of the public subnets"
}
output "private_subnet_ids" {
  value       = { for k, v in azurerm_subnet.private : k => v.id }
  description = "IDs of the private subnets"
}
output "public_nsg_ids" {
  value       = { for k, v in azurerm_network_security_group.public_nsg : k => v.id }
  description = "IDs of the public NSGs"
}
output "private_nsg_ids" {
  value       = { for k, v in azurerm_network_security_group.private_nsg : k => v.id }
  description = "IDs of the private NSGs"
}
output "public_subnet_names" {
  value       = { for k, v in azurerm_subnet.public : k => v.name }
  description = "Names of the public subnets"
}
output "private_subnet_names" {
  value       = { for k, v in azurerm_subnet.private : k => v.name }
  description = "Names of the private subnets"
}
output "public_nsg_names" {
  value       = { for k, v in azurerm_network_security_group.public_nsg : k => v.name }
  description = "Names of the public NSGs"
}
output "private_nsg_names" {
  value       = { for k, v in azurerm_network_security_group.private_nsg : k => v.name }
  description = "Names of the private NSGs"
}