resource "azurerm_kubernetes_cluster" "robot_shop_kubernetes_cluster" {
    for_each = { for k8s in var.kubernetes_cluster : k8s.name => k8s }

    name                    = each.value.name
    location                = each.value.location
    resource_group_name     = each.value.resource_group_name
    dns_prefix              = each.value.dns_prefix
    private_cluster_enabled = each.value.private_cluster_enabled

    identity {
        type = each.value.identity.type
    }

    default_node_pool {
        name           = each.value.default_node_pool.name
        node_count     = each.value.default_node_pool.node_count
        vm_size        = each.value.default_node_pool.vm_size
        vnet_subnet_id = var.subnets[each.value.default_node_pool.subnet_name]
    }

    network_profile {
        network_plugin    = each.value.network_profile.network_plugin
        network_policy    = each.value.network_profile.network_policy
        load_balancer_sku = each.value.network_profile.load_balancer_sku
        outbound_type     = each.value.network_profile.outbound_type
    }
}