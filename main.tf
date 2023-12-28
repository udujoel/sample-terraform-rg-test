# Resource Groups

module "resource_groups" {
  source = "./modules/resource_groups"
  resource_groups = var.resource_groups
}