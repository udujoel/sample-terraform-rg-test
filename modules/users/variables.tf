
variable "user_principal_name" {
  type        = string
  description = "(required) example@yourdomain.com"
  default     = ""
}
variable "user_display_name" {
  type        = string
  description = "(optional) Display Name"
  default     = ""
}
variable "user_password" {
  type        = string
  description = "(optional) User temp password"
  default     = ""
}

variable "user_role" {
    type = string
    description = "(required) User's role"
    default = "Reader"
}

variable "user_role_scope" {
    type = string
    description = "(required) Scope of the role, example resource group id, subscription id..."
}