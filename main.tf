locals {
  resource_group_ids = module.resource_groups.resource_group_ids
}


# Resource Groups

module "resource_groups" {
  source          = "./modules/resource_groups"
  resource_groups = var.resource_groups
}


# User1 

module "user1" {
  source       = "./modules/users"
  user_details = var.users["user1"]
  role_scopes  = local.resource_group_ids
  depends_on   = [module.resource_groups]
}


# User2 

module "user2" {
  source       = "./modules/users"
  user_details = var.users["user2"]
  role_scopes  = local.resource_group_ids
  depends_on   = [module.resource_groups]
}
