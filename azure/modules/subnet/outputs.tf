output "subnet_id" {
    description = "The ID of the Subnet"
    value       = [for id in azurerm_subnet.robot_shop_subnet : id.id]
}