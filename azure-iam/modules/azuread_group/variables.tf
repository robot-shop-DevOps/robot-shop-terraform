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