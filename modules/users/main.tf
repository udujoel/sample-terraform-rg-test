# create user

resource "azuread_user" "user" {
  user_principal_name   = var.user_details.principal_name
  display_name          = var.user_details.display_name
  password              = var.user_details.password
  force_password_change = true
}


# Role assignment

resource "azurerm_role_assignment" "user_role" {
  for_each             = toset(var.role_scopes)
  scope                = each.value
  role_definition_name = var.user_details.role
  principal_id         = var.user_details.principal_name

  depends_on = [azuread_user.user]
}

