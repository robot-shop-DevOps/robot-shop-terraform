variable "role_assignment" {
    type = list(object({
        name                 = string
        scope                = string
        principal_id         = string
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