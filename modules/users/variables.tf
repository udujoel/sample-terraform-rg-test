
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

