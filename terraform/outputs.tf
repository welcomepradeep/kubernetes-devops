############################################################
# Control Plane
############################################################

output "control_plane_public_ip" {

  description = "Public IP of Kubernetes control plane"

  value = aws_instance.control_plane.public_ip
}

output "control_plane_public_dns" {

  description = "Public DNS of Kubernetes control plane"

  value = aws_instance.control_plane.public_dns
}

output "control_plane_private_ip" {

  description = "Private IP of Kubernetes control plane"

  value = aws_instance.control_plane.private_ip
}

############################################################
# Worker 01
############################################################

output "worker01_public_ip" {

  description = "Public IP of Kubernetes worker 01"

  value = aws_instance.worker01.public_ip
}

output "worker01_public_dns" {

  description = "Public DNS of Kubernetes worker 01"

  value = aws_instance.worker01.public_dns
}

output "worker01_private_ip" {

  description = "Private IP of Kubernetes worker 01"

  value = aws_instance.worker01.private_ip
}

############################################################
# Worker 02
############################################################

output "worker02_public_ip" {

  description = "Public IP of Kubernetes worker 02"

  value = aws_instance.worker02.public_ip
}

output "worker02_public_dns" {

  description = "Public DNS of Kubernetes worker 02"

  value = aws_instance.worker02.public_dns
}

output "worker02_private_ip" {

  description = "Private IP of Kubernetes worker 02"

  value = aws_instance.worker02.private_ip
}

############################################################
# SSH Commands
############################################################

output "ssh_control_plane" {

  description = "SSH command for control plane"

  value = "ssh -i k8s-lab-key.pem ${var.ssh_user}@${aws_instance.control_plane.public_ip}"
}

output "ssh_worker01" {

  description = "SSH command for worker 01"

  value = "ssh -i k8s-lab-key.pem ${var.ssh_user}@${aws_instance.worker01.public_ip}"
}

output "ssh_worker02" {

  description = "SSH command for worker 02"

  value = "ssh -i k8s-lab-key.pem ${var.ssh_user}@${aws_instance.worker02.public_ip}"
}
