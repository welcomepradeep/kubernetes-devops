output "control_plane_public_ip" {
  value = aws_instance.control_plane.public_ip
}

output "control_plane_private_ip" {
  value = aws_instance.control_plane.private_ip
}

output "worker01_public_ip" {
  value = aws_instance.worker01.public_ip
}

output "worker01_private_ip" {
  value = aws_instance.worker01.private_ip
}

output "worker02_public_ip" {
  value = aws_instance.worker02.public_ip
}

output "worker02_private_ip" {
  value = aws_instance.worker02.private_ip
}
