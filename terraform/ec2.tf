############################################################
# Kubernetes Control Plane
############################################################

resource "aws_instance" "control_plane" {

  ami = var.ami_id

  instance_type = var.control_plane_instance_type

  subnet_id = aws_subnet.k8s.id

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              hostnamectl set-hostname k8s-control-plane

              systemctl enable chronyd || true
              systemctl start chronyd || true

              EOF

  tags = {
    Name = "k8s-control-plane"
    Role = "control-plane"
  }
}

############################################################
# Kubernetes Worker 01
############################################################

resource "aws_instance" "worker01" {

  ami = var.ami_id

  instance_type = var.worker_instance_type

  subnet_id = aws_subnet.k8s.id

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              hostnamectl set-hostname k8s-worker01

              systemctl enable chronyd || true
              systemctl start chronyd || true

              EOF

  tags = {
    Name = "k8s-worker01"
    Role = "worker"
  }
}

############################################################
# Kubernetes Worker 02
############################################################

resource "aws_instance" "worker02" {

  ami = var.ami_id

  instance_type = var.worker_instance_type

  subnet_id = aws_subnet.k8s.id

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              hostnamectl set-hostname k8s-worker02

              systemctl enable chronyd || true
              systemctl start chronyd || true

              EOF

  tags = {
    Name = "k8s-worker02"
    Role = "worker"
  }
}
