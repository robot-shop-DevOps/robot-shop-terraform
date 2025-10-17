resource "azurerm_lb_backend_address_pool" "DevOps_backend_address_pool" {
    for_each = { for ba in var.backend_address_pool : ba.name => ba }

    name            = each.value.name
    loadbalancer_id = var.load_balancers[each.value.loadbalancer]
}