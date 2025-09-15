variable "kubernetes_nodes" {
    type = list(object({
        name                    = string
        kubernetes_cluster_name = string
        vm_size                 = string 
        node_count              = number
        subnet_name             = string
    }))
}

variable "kubernetes_clusters" {
    type = map(string)
}

variable "subnets" {
    type = map(string)
}