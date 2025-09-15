variable "kubernetes_cluster" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        
        identity            = object({
            type = string
        })

        default_node_pool = object({
            name        = string
            node_count  = number
            vm_size     = string
            subnet_name = string
        })

        dns_prefix              = string
        private_cluster_enabled = bool

        network_profile         = object({
            network_plugin    = string
            network_policy    = string
            load_balancer_sku = string
            outbound_type     = string
            service_cidr      = string
        })
    }))
}

variable "subnets" {
    type = map(string)
}