resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
    for_each = { for k8s in var.kubernetes_cluster : k8s.name => k8s }

    name                       = each.value.name
    location                   = each.value.location
    resource_group_name        = each.value.resource_group_name
    dns_prefix                 = try(
        each.value.dns_prefix, null
    )
    dns_prefix_private_cluster = try(
        each.value.dns_prefix_private_cluster, null
    )
    private_cluster_enabled    = each.value.private_cluster_enabled

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
        network_plugin      = each.value.network_profile.network_plugin
        network_policy      = try(
            each.value.network_profile.network_policy, null
        )
        network_data_plane  = try(
            each.value.network_profile.network_data_plane, null
        )
        network_plugin_mode = try(
            each.value.network_profile.network_plugin_mode, null
        )
        load_balancer_sku   = try(
            each.value.network_profile.load_balancer_sku, null
        )
        outbound_type       = try(
            each.value.network_profile.outbound_type, null
        )
        pod_cidr            = try(
            each.value.network_profile.pod_cidr, null
        )
        service_cidr        = try(
            each.value.network_profile.service_cidr, null
        )
        dns_service_ip      = try(
            each.value.network_profile.dns_service_ip, null
        )
    }

    lifecycle {
        ignore_changes = [
            default_node_pool[0].upgrade_settings,
        ]
    }
}