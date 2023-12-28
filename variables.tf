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