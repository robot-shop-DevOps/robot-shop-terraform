resource "azurerm_kubernetes_cluster_node_pool" "kubernetes_node_pool" {
    for_each = { for np in var.kubernetes_node_pool : np.name => np }

    name                  = each.value.name
    kubernetes_cluster_id = var.kubernetes_clusters[each.value.kubernetes_cluster]
    vm_size               = each.value.vm_size
    vnet_subnet_id        = var.subnets[each.value.vnet_subnet]
    node_labels           = try(
        each.value.node_labels, null
    )
    node_taints           = try(
        each.value.node_taints, null
    )

    tags                  = each.value.tags
}