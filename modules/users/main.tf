# create user

resource "azuread_user" "user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.user_display_name
  password              = var.user_password
  force_password_change = true
}


# Role assignment

resource "azurerm_role_assignment" "role" {
  scope                = var.user_role_scope
  role_definition_name = var.user_role
  principal_id         = var.user_principal_name
}

