variable "machine_type" {
  type = string
}

variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "subnetwork_project" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "hostname" {
  type    = string
  default = ""
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
  type    = bool
  default = true
}

variable "boot_disk_type" {
  type    = string
  default = "pd-standard"
}

variable "boot_disk_size" {
  type = string
  default = "30"
}

variable "boot_disk_image" {
  type    = string
}