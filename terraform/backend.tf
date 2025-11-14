terraform {
  backend "s3" {
    bucket = "terraform-backend-devopsbyfasil.space"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
