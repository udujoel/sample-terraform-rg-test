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
  description = "location for resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to apply to resources."
  type        = "map"
  default     = {}
}