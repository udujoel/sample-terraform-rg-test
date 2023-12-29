output "resource_groups" {
  value = {
    for rg in azurerm_resource_group.resource_groups : rg.name => {
      name     = rg.name
      location = rg.location
      tags     = rg.tags
    }
  }
  description = "output created resource groups with their attributes"
}


output "resource_group_ids" {
  value = [for rg in azurerm_resource_group.resource_groups : rg.id]
}
