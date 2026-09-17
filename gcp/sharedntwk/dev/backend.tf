terraform {
  backend "gcs" {
    bucket = "robotshop-sharedntwk-dev-terraform-state"
  }
}