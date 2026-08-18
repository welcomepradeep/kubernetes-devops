provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Kubernetes-DevOps"
      Environment = "Lab"
      ManagedBy   = "Terraform"
    }
  }
}
