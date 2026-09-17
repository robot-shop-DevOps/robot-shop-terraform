variable "shared_vpc_host" {
    type = list(object({
        project         = string
        deletion_policy = optional(string, "PREVENT")
    }))
    default = []
}