variable "role_assignment" {
    type = list(object({
        scope                = string
        principal_id         = string
        name                 = optional(string)
        principal_type       = optional(string)
        description          = optional(string)
        role_definition_id   = optional(string)
        role_definition_name = optional(string)
        condition            = optional(string)
    }))
}

variable "principal_id" {
    type = map(string)
}

variable "scope" {
    type = map(string)
}