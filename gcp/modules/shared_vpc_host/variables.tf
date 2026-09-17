variable "shared_vpc_host" {
    type = list(object({
        name    = string
        project = string
    }))
    default = []
}