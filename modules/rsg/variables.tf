variable "name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Location"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
