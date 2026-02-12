variable "tenant_id" {
    type = string
}

variable "azuread_group" {
    type = list(object({
        display_name     = string
        description      = optional(string)
        security_enabled = bool
        owners           = optional(set(string))
        members          = optional(set(string))
    }))
    default = []
} 

variable "role_assignment" {
    type = list(object({
        role_name            = string   #label for outputs in the module, not passed to main.tf
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