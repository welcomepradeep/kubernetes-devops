variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "Kubernetes-DevOps"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "Lab"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Kubernetes subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "ap-south-1a"
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "control_plane_private_ip" {
  description = "Static private IP for Kubernetes control-plane"
  type        = string
  default     = "10.0.1.10"
}

variable "worker1_private_ip" {
  description = "Static private IP for Kubernetes worker 1"
  type        = string
  default     = "10.0.1.11"
}

variable "worker2_private_ip" {
  description = "Static private IP for Kubernetes worker 2"
  type        = string
  default     = "10.0.1.12"
}
