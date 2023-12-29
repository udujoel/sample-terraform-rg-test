
output "user_principal_id" {
  value       = azuread_user.user.object_id
  description = "The object ID of the Azure AD user"
}

output "user_principal_name" {
    value = azuread_user.user.user_principal_name
    description = "UPN of created user"
}