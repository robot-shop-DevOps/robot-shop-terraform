output "kubernetes_cluster_ids" {
    description = "Map of Kubernetes Cluster IDs keyed by cluster name"
    value       = { for k8s in azurerm_kubernetes_cluster.kubernetes_cluster : k8s.name => k8s.id }
}