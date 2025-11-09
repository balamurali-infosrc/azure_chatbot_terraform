variable "prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
#   default = "eastus"
}

variable "rg_name" {
  type = string
}

variable "function_identity_object_id" {
  type = string
}
