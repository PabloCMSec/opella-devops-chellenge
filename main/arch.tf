module "vnet" {
  source              = "../modules/vnet"
  name                = "${local.environment}-opella-vnet"
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
  name        = "${local.environment}-opella-rg"
  location    = var.location
  environment = local.environment
  tags        = var.tags
}

module "storage" {
  source                   = "../modules/sta"
  name                     = "${local.environment}opellastorage"
  location                 = var.location
  resource_group_name      = module.rsg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  environment              = local.environment
  tags                     = var.tags
}

module "ubuntu-vm" {
  source              = "../modules/ubuntu-vm"
  name                = "${local.environment}-opella-vm"
  location            = var.location
  resource_group_name = module.rsg.name
  size                = var.vm_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  subnet_id           = module.vnet.private_subnet_ids[var.vm_subnet_key]
  environment         = local.environment
  tags                = var.tags
}

