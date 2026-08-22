############################################################
# Control Plane Outputs
############################################################

output "control_plane_public_ip" {
  description = "Public IP of Kubernetes control-plane"

  value = aws_instance.control_plane.public_ip
}

output "control_plane_public_dns" {
  description = "Public DNS of Kubernetes control-plane"

  value = aws_instance.control_plane.public_dns
}

output "control_plane_private_ip" {
  description = "Private IP of Kubernetes control-plane"

  value = aws_instance.control_plane.private_ip
}


############################################################
# Worker 1 Outputs
############################################################

output "worker1_public_ip" {
  description = "Public IP of Kubernetes worker 1"

  value = aws_instance.worker1.public_ip
}

output "worker1_public_dns" {
  description = "Public DNS of Kubernetes worker 1"

  value = aws_instance.worker1.public_dns
}

output "worker1_private_ip" {
  description = "Private IP of Kubernetes worker 1"

  value = aws_instance.worker1.private_ip
}


############################################################
# Worker 2 Outputs
############################################################

output "worker2_public_ip" {
  description = "Public IP of Kubernetes worker 2"

  value = aws_instance.worker2.public_ip
}

output "worker2_public_dns" {
  description = "Public DNS of Kubernetes worker 2"

  value = aws_instance.worker2.public_dns
}

output "worker2_private_ip" {
  description = "Private IP of Kubernetes worker 2"

  value = aws_instance.worker2.private_ip
}


############################################################
# VPC
############################################################

output "vpc_id" {
  description = "Kubernetes VPC ID"

  value = aws_vpc.k8s.id
}


############################################################
# Subnet
############################################################

output "subnet_id" {
  description = "Kubernetes subnet ID"

  value = aws_subnet.k8s.id
}


############################################################
# Security Group
############################################################

output "security_group_id" {
  description = "Kubernetes security group ID"

  value = aws_security_group.k8s.id
}


############################################################
# Automatically Detected Public IP
############################################################

output "terraform_runner_public_ip" {
  description = "Public IP detected automatically by Terraform"

  value = chomp(data.http.my_public_ip.response_body)
}
