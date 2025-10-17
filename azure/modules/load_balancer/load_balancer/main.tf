resource "azurerm_lb" "load_balancer" {
    for_each = { for lb in var.load_balancer : lb.name => lb }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    sku                 = each.value.sku
    tags                = each.value.tags

    frontend_ip_configuration {
        name                 = each.value.frontend_ip_configuration.name
        public_ip_address_id = var.public_ips[each.value.frontend_ip_configuration.public_ip_address_id]
    }
}