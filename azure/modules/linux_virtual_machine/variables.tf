variable "linux_virtual_machines" {
    type = list(object({
        name                             = string
        location                         = string
        resource_group_name              = string
        size                             = string
        network_interface_names          = list(string)
        os_disk_caching                  = string
        os_disk_storage_account_type     = string
        os_disk_disk_size_gb             = optional(number)
        os_disk_name                     = optional(string)  
        admin_username                   = string
        zone                             = optional(string)
        source_image_reference_publisher = string
        source_image_reference_offer     = string
        source_image_reference_sku       = string
        source_image_reference_version   = string
    }))
}

variable "network_interfaces" {
    type = map(string)
}

variable "key_vault" {
   type = object({
        name = string
        resource_group_name = string
        secret_name = list(string)
   })
}