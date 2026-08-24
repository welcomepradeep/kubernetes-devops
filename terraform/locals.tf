############################################################
# Local Values
############################################################

locals {
  project_name = "Kubernetes-DevOps"
  environment  = "Lab"

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}
