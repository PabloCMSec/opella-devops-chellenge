output "vnet_id" {
  value       = azurerm_virtual_network.this.id
  description = "ID of the VNet"
}

output "public_subnet_ids" {
  value       = { for name, s in azurerm_subnet.public : name => s.id }
  description = "Public subnet IDs"
}

output "private_subnet_ids" {
  value       = { for name, s in azurerm_subnet.private : name => s.id }
  description = "Private subnet IDs"
}

output "public_nsg_ids" {
  value       = { for name, nsg in azurerm_network_security_group.public_nsg : name => nsg.id }
  description = "Public NSG IDs"
}

output "private_nsg_ids" {
  value       = { for name, nsg in azurerm_network_security_group.private_nsg : name => nsg.id }
  description = "Private NSG IDs"
}
