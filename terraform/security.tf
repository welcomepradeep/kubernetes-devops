resource "aws_security_group" "k8s" {

  name        = "k8s-lab-sg"
  description = "Security group for Kubernetes lab"
  vpc_id      = aws_vpc.k8s.id


  ##########################################################
  # SSH
  ##########################################################

  ingress {
    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      var.allowed_ssh_cidr
    ]
  }


  ##########################################################
  # Kubernetes API Server
  ##########################################################

  ingress {
    description = "Kubernetes API Server"

    from_port = 6443
    to_port   = 6443

    protocol = "tcp"

    cidr_blocks = [
      var.subnet_cidr
    ]
  }


  ##########################################################
  # HTTP
  ##########################################################

  ingress {
    description = "HTTP"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

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

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  ##########################################################
  # Kubernetes NodePort
  ##########################################################

  ingress {
    description = "Kubernetes NodePort"

    from_port = 30000
    to_port   = 32767

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  ##########################################################
  # Kubernetes internal communication
  ##########################################################

  ingress {
    description = "Kubernetes internal traffic"

    from_port = 0
    to_port   = 65535

    protocol = "-1"

    cidr_blocks = [
      var.subnet_cidr
    ]
  }


  ##########################################################
  # Outbound
  ##########################################################

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  tags = {
    Name = "k8s-lab-sg"
  }
}
