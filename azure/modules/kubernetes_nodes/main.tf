resource "azurerm_kubernetes_cluster_node_pool" "robot_shop_kubernetes_nodes" {
    for_each = { for node in var.kubernetes_nodes : node.name => node }

    name                  = each.value.name
    kubernetes_cluster_id = var.kubernetes_clusters[each.value.kubernetes_cluster_name]
    vm_size               = each.value.vm_size
    node_count            = each.value.node_count
    vnet_subnet_id        = var.subnets[each.value.subnet_name]
}