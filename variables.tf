variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/test/prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus2"
}

variable "state_rg" {
  description = "Resource group for remote state"
  type        = string
}

variable "state_sa" {
  description = "Storage account for remote state"
  type        = string
}

variable "state_container" {
  description = "Container name for remote state"
  type        = string
}

# Network defaults
variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "app_subnet_prefix" {
  description = "App subnet prefixes"
  type        = list(string)
}


# Platform defaults
variable "function_linux_fx" {
  type    = string
  default = "NODE|18"
}
variable "app_sku_tier" {
  type    = string
  default = "Standard"
}
variable "app_sku_size" {
  type    = string
  default = "S1"
}


