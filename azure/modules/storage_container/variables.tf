variable "storage_container" {
    type = list(object({
        storage_account       = string
        name                  = string
        container_access_type = string
    }))
}

variable "storage_account" {
    type = map(string)
}