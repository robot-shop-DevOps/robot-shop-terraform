variable "project_id" {
  type        = string
  description = "Project where the GKE cluster will be created."
}

variable "cluster_name" {
  type    = string
}

variable "location" {
  type    = string
}

variable "networking_mode" {
  type    = string
  default = "VPC_NATIVE"
}

variable "network" {
  type        = string
  description = "Existing VPC self link or name."
}

variable "subnetwork" {
  type        = string
  description = "Existing subnet self link or name."
}

variable "default_max_pods_per_node" {
  type    = number
  default = 32
}

variable "cluster_secondary_range_name" {
  type        = string
}

variable "services_secondary_range_name" {
  type        = string
}

variable "datapath_provider" {
  type    = string
  default = "ADVANCED_DATAPATH"
}
