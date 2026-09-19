variable "machine_type" {
  type = string
}

variable "name" {
  type = string
}

variable "zone" {
  type = optional(string)
}

variable "subnetwork" {
  type = string
}

variable "subnetwork_project" {
  type = string
}

variable "description" {
  type = optional(string)
}

variable "hostname" {
  type = optional(string)
}

variable "project" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "service_account_scopes" {
  type    = list(string)
  default = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "boot_disk_auto_delete" {
  type    = optional(bool)
  default = true
}

variable "boot_disk_type" {
  type    = string
  default = "pd-ssd"
}

variable "boot_disk_size" {
  type = optional(string)
}

variable "boot_disk_image" {
  type    = string
}