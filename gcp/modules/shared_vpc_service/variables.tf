variable "shared_vpc_service" {
    type = list(object({
        host_project    = string
        service_project = string
    }))
    default = []
}