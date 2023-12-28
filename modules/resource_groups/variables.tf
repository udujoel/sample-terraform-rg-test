variable "resource_groups" {
    type = list(object({
        name = string
        location = string
        tags = map(string)
    }))
    description = "(Required) list of the resource groups to create"
}