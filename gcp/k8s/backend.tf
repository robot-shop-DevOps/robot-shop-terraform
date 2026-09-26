terraform {
  backend "gcs" {
    bucket = "robotshop-k8s-dev-terraform-state"
  }
}