############################################################
# Automatically detect Terraform runner public IP
############################################################

data "http" "my_public_ip" {
  url = "https://checkip.amazonaws.com/"
}


############################################################
# Security Group
############################################################

resource "aws_security_group" "k8s" {
  name        = "k8s-lab-sg"
  description = "Security group for Kubernetes lab"
  vpc_id      = aws_vpc.k8s.id


  ##########################################################
  # SSH
  ##########################################################

  ingress {
    description = "SSH from Terraform workstation"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      "${chomp(data.http.my_public_ip.response_body)}/32"
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
      "${chomp(data.http.my_public_ip.response_body)}/32"
    ]
  }


  ##########################################################
  # Kubernetes Internal Communication
  ##########################################################

  ingress {
    description = "Kubernetes internal traffic"

    from_port = 0
    to_port   = 0

    protocol = "-1"

    self = true
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
  # All Outbound Traffic
  ##########################################################

  egress {
    description = "Allow all outbound traffic"

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  ##########################################################
  # Tags
  ##########################################################

  tags = {
    Name = "k8s-lab-sg"
  }
}
