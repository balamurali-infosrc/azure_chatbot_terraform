variable "prefix"      { type = string }
variable "environment" { type = string }
variable "location"    { 
  type = string 
  default = "canadacentral"
  }
variable "rg_name"     { type = string }

variable "storage_account_name" { type = string }
variable "storage_account_key" { type = string }

variable "sku_tier" { type = string }
variable "sku_size" { type = string }
variable "linux_fx_version" { type = string }

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "run_from_package" { 
    type = bool 
    default = true
     }
