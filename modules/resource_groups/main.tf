locals {
  resource_groups = {for rg in var.resource_groups : rg.name => rg}
}

# create resource groups supplied through var.resource_groups
resource "azurerm_resource_group" "resource_groups" {
  for_each = locals.resource_groups
  name     = each.value.name
  location = each.value.location
  tags = each.value.tags
}