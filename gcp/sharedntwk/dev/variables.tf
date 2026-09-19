variable "shared_vpc_host" {
    type = list(object({
        project         = string
        deletion_policy = optional(string, "PREVENT")
    }))
    default = []
}

variable "shared_vpc_service" {
    type = list(object({
        host_project    = string
        service_project = string
    }))
    default = []
}

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

variable "subnetwork-ipv4" {
    type = list(object({
        name          = string
        network       = string
        region        = string
        description   = optional(string)
        ip_cidr_range = string
    }))
}