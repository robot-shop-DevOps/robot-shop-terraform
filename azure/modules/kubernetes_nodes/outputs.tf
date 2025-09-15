output "kubernetes_nodes_ids" {
    description = "Map of Kubernetes Node Ids keyed by node name"
    value = { for node in azurerm_kubernetes_cluster_node_pool.robot_shop_kubernetes_nodes : node.name => node.id }
}