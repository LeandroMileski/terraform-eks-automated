terraform {
  backend "s3" {
    bucket         = "your-unique-terraform-state-bucket"
    key            = "eks/staging/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    use_lockfile   = true
  }
}