module "network" {
  source             = "./modules/network"
  prefix             = var.prefix
  environment        = var.environment
  location           = var.location
  vnet_address_space = var.vnet_address_space
  app_subnet_prefix  = var.app_subnet_prefix
}

module "data" {
  source      = "./modules/data"
  prefix      = var.prefix
  environment = var.environment
  location    = var.location
  rg_name     = module.network.resource_group_name
}

module "platform" {
  source      = "./modules/platform"
  prefix      = var.prefix
  environment = var.environment
  location    = var.location
  rg_name     = module.network.resource_group_name

  storage_account_name = module.data.storage_account_name
  storage_account_key  = module.data.storage_account_primary_key

  sku_tier         = var.app_sku_tier
  sku_size         = var.app_sku_size
  linux_fx_version = var.function_linux_fx
}

module "ai" {
  source      = "./modules/ai"
  prefix      = var.prefix
  environment = var.environment
  location    = var.location
  rg_name     = module.network.resource_group_name
}

module "security" {
  source      = "./modules/security"
  prefix      = var.prefix
  environment = var.environment
  location    = var.location
  rg_name     = module.network.resource_group_name

  function_identity_object_id = module.platform.function_identity_object_id
}
