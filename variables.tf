variable "subscription_id" {
    type = string
    description = "environment's subscription id"
    default = ""
}

variable "client_id" {
    type = string
    description = "service principal's id"
    default = ""
}

variable "client_secret" {
    type = string
    description = "service principal's secret value"
    default = ""
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID for the directory."
  default = ""
}

variable "location" {
  type        = string
  description = "location for resources."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to resources."
  default     = {}
}

variable "resource_groups" {
    type = list(object({
        name = string
        location = string
        tags = map(string)
    }))
    description = "(Required) list of the resource groups to create"
}


variable "users" {
  description = "Map of user details objects"
  type = map(object({
    display_name     = string
    password         = string
    principal_name   = string
    role             = string
  }))
}

variable "user_details" {
  description = "User details role scopes"
  type = object({
    display_name     = string
    password         = string
    principal_name   = string
    role             = string
  })
  default = {
    display_name = ""
    password = ""
    principal_name = ""
    role = ""
  }
}

variable "role_scopes" {
  description = "List of scopes for the user role"
  type        = list(string)
  default = [ "" ]
}
