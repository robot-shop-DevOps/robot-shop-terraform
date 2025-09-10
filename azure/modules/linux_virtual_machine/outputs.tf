output "linux_vm_ids" {
    description = "Map of linux VM IDs keyed by VM name"
    value       = { for vm in azurerm_linux_virtual_machine.robot_shop_vm : vm.name => vm.id }
}