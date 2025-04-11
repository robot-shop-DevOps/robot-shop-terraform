terraform {
  backend "s3" {
    bucket       = "robot-shop-terraform-statefile"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}