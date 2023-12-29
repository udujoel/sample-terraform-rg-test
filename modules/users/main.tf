
resource "azuread_user" "user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.user_display_name
  password              = var.user_password
  force_password_change = true
}
