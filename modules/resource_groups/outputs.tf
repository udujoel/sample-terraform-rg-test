
output "resource_group_ids" {
  value = [for rg in azurerm_resource_group.resource_groups : rg.id]
  description = "IDs of created resource groups"
}
