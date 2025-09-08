variable "s3_bucket" {
  type = list(object({
    bucket = optional(string)
    versioning = optional(list(object({
      enabled = bool
    })))
  }))
}