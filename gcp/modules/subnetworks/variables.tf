variable "subnetwork-ipv4" {
    type = list(object({
        name          = string
        network       = string
        region        = string
        description   = optional(string)
        ip_cidr_range = string
    }))
}

variable "vpc_network" {
    type = map(string)
}