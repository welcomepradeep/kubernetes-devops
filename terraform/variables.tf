############################################################
# AWS Region
############################################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

############################################################
# Availability Zone
############################################################

variable "availability_zone" {
  description = "Availability Zone for Kubernetes lab"
  type        = string
  default     = "ap-south-1a"
}

############################################################
# VPC CIDR
############################################################

variable "vpc_cidr" {
  description = "CIDR block for Kubernetes VPC"
  type        = string
  default     = "10.0.0.0/16"
}

############################################################
# Subnet CIDR
############################################################

variable "subnet_cidr" {
  description = "CIDR block for Kubernetes subnet"
  type        = string
  default     = "10.0.1.0/24"
}

############################################################
# AMI
############################################################

variable "ami_id" {
  description = "AMI ID for Kubernetes nodes"
  type        = string
}

############################################################
# EC2 Instance Type
############################################################

variable "control_plane_instance_type" {
  description = "Instance type for Kubernetes control plane"
  type        = string
  default     = "t3.small"
}

variable "worker_instance_type" {
  description = "Instance type for Kubernetes workers"
  type        = string
  default     = "t3.small"
}

############################################################
# SSH Key
############################################################

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

############################################################
# SSH User
############################################################

variable "ssh_user" {
  description = "SSH user for EC2"
  type        = string
  default     = "ec2-user"
}
