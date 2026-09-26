variable "k3s_controlplane_machine_type" {
  type = string
}

variable "k3s_controlplane_name" {
  type = string
}

variable "k3s_controlplane_zone" {
  type = string
}

variable "k3s_controlplane_subnetwork" {
  type = string
}

variable "k3s_controlplane_subnetwork_project" {
  type = string
}

variable "k3s_controlplane_project" {
  type = string
}

variable "k3s_controlplane_service_account_email" {
  type = string
}

variable "k3s_controlplane_boot_disk_image" {
  type    = string
}

variable "k3s_network_tags" {
  type    = list(string)
  default = []
}