variable "kubernetes_node_pool" {
    type = list(object({
        name               = string
        kubernetes_cluster = string
        vm_size            = string
        node_labels        = optional(map(string))
        node_taints        = optional(list(string))
        vnet_subnet        = string
        tags               = map(string)
    }))
}

variable "kubernetes_clusters" {
    type = map(string)
}

variable "subnets" {
    type = map(string)
}