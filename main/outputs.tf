output "rsg_name" {
  value       = module.rsg.name
  description = "Name of the resource group"
}

output "rsg_id" {
  value       = module.rsg.id
  description = "ID of the resource group"
}
output "rsg_location" {
  value       = module.rsg.location
  description = "Location of the resource group"
}
output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "Name of the VNet"
}
output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "ID of the VNet"
}
output "vnet_address_space" {
  value       = module.vnet.vnet_address_space
  description = "Address space of the VNet"
}

output "public_subnet_ids" {
  value       = module.vnet.public_subnet_ids
  description = "Public subnet IDs"
}
output "private_subnet_ids" {
  value       = module.vnet.private_subnet_ids
  description = "Private subnet IDs"
}
output "public_nsg_ids" {
  value       = module.vnet.public_nsg_ids
  description = "Public NSG IDs"
}
output "private_nsg_ids" {
  value       = module.vnet.private_nsg_ids
  description = "Private NSG IDs"
}