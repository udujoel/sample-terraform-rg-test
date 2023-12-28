output "resource_groups" {
  value = {
    for rg, info in azurerm_resource_group.resource_groups : rg => {
      id       = info.id
      name     = info.name
      location = info.location
      tags     = info.tags
    }
  }
  description = "output created resource groups with their attributes"
}
