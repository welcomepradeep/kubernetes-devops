############################################################
# Kubernetes VPC
############################################################

resource "aws_vpc" "k8s" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "k8s-lab-vpc"
  }
}
