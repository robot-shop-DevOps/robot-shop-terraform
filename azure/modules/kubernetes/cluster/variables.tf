variable "kubernetes_cluster" {
    type = list(object({
        name                       = string
        location                   = string
        resource_group_name        = string
        
        identity                   = object({
            type = string
        })

        default_node_pool          = object({
            name        = string
            node_count  = number
            vm_size     = string
            subnet_name = string
        })

        dns_prefix                 = optional(string)
        dns_prefix_private_cluster = optional(string)
        private_cluster_enabled    = bool

        network_profile            = object({
            network_plugin      = string
            network_mode        = optional(string)
            network_policy      = optional(string)
            network_data_plane  = optional(string)
            network_plugin_mode = optional(string)
            load_balancer_sku   = optional(string)
            outbound_type       = optional(string)
            pod_cidr            = optional(string)
            service_cidr        = optional(string)
            dns_service_ip      = optional(string)
        })

        tags = map(string)
    }))
}

variable "subnets" {
    type = map(string)
}