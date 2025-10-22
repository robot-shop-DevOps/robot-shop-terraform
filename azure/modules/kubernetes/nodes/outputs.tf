output "kubernetes_node_pool_ids" {
    description = "Map of Kubernetes Node Pool IDs keyed by name"
    value       = { for np in azurerm_kubernetes_cluster_node_pool.kubernetes_node_pool : np.name => np.id }
}