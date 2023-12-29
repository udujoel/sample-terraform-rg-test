variable "user_details" {
  description = "User details excluding role scopes"
  type = object({
    display_name     = string
    password         = string
    principal_name   = string
    role             = string
  })
}

variable "role_scopes" {
  description = "List of scopes for the user role"
  type        = list(string)
}
