output "id" {
  description = "The ID of the VM"
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "The name of the VM"
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.this.private_ip_address
}
output "admin_username" {
  description = "The admin username for the VM"
  value       = azurerm_linux_virtual_machine.this.admin_username
}

output "nic_name" {
  description = "The name of the network interface"
  value       = azurerm_network_interface.this.name
}
output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}
output "location" {
  description = "The location of the VM"
  value       = azurerm_linux_virtual_machine.this.location
}