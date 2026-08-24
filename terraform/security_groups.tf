############################################################
# Kubernetes Security Group
############################################################

resource "aws_security_group" "k8s" {

  name        = "k8s-lab-sg"
  description = "Security group for Kubernetes control plane and workers"
  vpc_id      = aws_vpc.k8s.id

  ##########################################################
  # SSH from the machine running Terraform
  ##########################################################

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ##########################################################
  # Kubernetes API Server
  ##########################################################

  ingress {
    description = "Kubernetes API server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ##########################################################
  # Kubernetes internal communication
  ##########################################################

  ingress {
    description = "Allow Kubernetes nodes to communicate"

    from_port = 0
    to_port   = 65535
    protocol  = "tcp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  ##########################################################
  # UDP internal communication
  ##########################################################

  ingress {
    description = "Allow Kubernetes node UDP communication"

    from_port = 0
    to_port   = 65535
    protocol  = "udp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  ##########################################################
  # ICMP
  ##########################################################

  ingress {
    description = "Allow ICMP inside VPC"

    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  ##########################################################
  # HTTP
  ##########################################################

  ingress {
    description = "HTTP"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ##########################################################
  # HTTPS
  ##########################################################

  ingress {
    description = "HTTPS"

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ##########################################################
  # NodePort
  ##########################################################

  ingress {
    description = "Kubernetes NodePort"

    from_port = 30000
    to_port   = 32767
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ##########################################################
  # Outbound
  ##########################################################

  egress {
    description = "Allow all outbound traffic"

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "k8s-lab-sg"
  }
}
