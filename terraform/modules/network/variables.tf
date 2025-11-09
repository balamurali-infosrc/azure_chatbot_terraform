variable "prefix" {
  type        = string
  description = "Resource name prefix"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "vnet_address_space" {
  type = list(string)
}

variable "app_subnet_prefix" {
  type = list(string)
}


    
