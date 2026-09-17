variable "shared_vpc_service" {
    type = list(object({
        name            = string
        host_project    = string
        service_project = string
    }))
    default = []
}