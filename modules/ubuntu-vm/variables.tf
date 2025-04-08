variable "name" {
  description = "Name of the VNET"
  type        = string
}
variable "location" {
  description = "Azure location"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}
variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}
variable "subnet_id" {
  description = "ID of the subnet where the VM will be deployed"
  type        = string
}
variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}

variable "environment" {
  description = "Environment tag"
  type        = string
}