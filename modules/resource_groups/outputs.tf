output "resource_group_name" {
  value       = azurerm_resource_group.resource_groups.name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.resource_groups.id
  description = "Resource group generated id"
}

output "resource_group_location" {
  value       = azurerm_resource_group.resource_groups.location
  description = "Resource group location (region)"
}