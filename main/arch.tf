module "vnet" {
  source              = "../modules/vnet"
  name                = "${local.environment}-vnet"
  location            = var.location
  resource_group_name = module.rsg.name
  address_space       = var.address_space
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  environment         = local.environment
  tags                = var.tags
}


module "rsg" {
  source      = "../modules/rsg"
  name        = "${local.environment}-rg"
  location    = var.location
  environment = local.environment
  tags        = var.tags
}