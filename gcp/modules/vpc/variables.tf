variable "vpc_network" {
    type = list(object({
        name                    = string
        project                 = string
        description             = optional(string)
        auto_create_subnetworks = optional(bool)
        routing_mode            = optional(string)
        deletion_policy         = optional(string, "PREVENT")
    }))
    default = []
}