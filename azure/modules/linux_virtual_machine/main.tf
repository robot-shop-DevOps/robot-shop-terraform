data "azurerm_key_vault" "robot_shop_vm" {
    name                = var.key_vault_name.name
    resource_group_name = var.key_vault_name.resource_group_name
}

data "azurerm_key_vault_secret" "robot_shop_vm_password" {
    for_each = { for vm in var.linux_virtual_machines : vm.name => vm }

    name         = each.key
    key_vault_id = data.azurerm_key_vault.robot_shop_vm.id
}

resource "azurerm_linux_virtual_machine" "robot_shop_vm" {
    for_each = { for vm in var.linux_virtual_machines : vm.name => vm }
    
    name                  = each.value.name
    resource_group_name   = each.value.resource_group_name
    location              = each.value.location
    size                  = each.value.size
    network_interface_ids = [ for nic_name in each.value.network_interface_names : var.network_interfaces[nic_name] ]

    os_disk {
        name                 = each.value.os_disk.name
        caching              = each.value.os_disk_caching
        storage_account_type = each.value.os_disk_storage_account_type      
        disk_size_gb         = each.value.os_disk.disk_size_gb
    }

    source_image_reference {
        publisher = each.value.source_image_reference_publisher
        offer     = each.value.source_image_reference_offer
        sku       = each.value.source_image_reference_sku
        version   = each.value.source_image_reference_version
    }

    admin_username                  = each.value.admin_username
    admin_password                  = data.azurerm_key_vault_secret.robot_shop_vm_password[each.key].value
    disable_password_authentication = false
}