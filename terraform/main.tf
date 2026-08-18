############################################################
# VPC
############################################################

resource "aws_vpc" "k8s" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "k8s-lab-vpc"
  }
}


############################################################
# Internet Gateway
############################################################

resource "aws_internet_gateway" "k8s" {

  vpc_id = aws_vpc.k8s.id

  tags = {
    Name = "k8s-lab-igw"
  }
}


############################################################
# Subnet
############################################################

resource "aws_subnet" "k8s" {

  vpc_id = aws_vpc.k8s.id

  cidr_block = var.subnet_cidr

  availability_zone = var.availability_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "k8s-lab-subnet"
  }
}


############################################################
# Route Table
############################################################

resource "aws_route_table" "k8s" {

  vpc_id = aws_vpc.k8s.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s.id
  }

  tags = {
    Name = "k8s-lab-route-table"
  }
}


############################################################
# Route Table Association
############################################################

resource "aws_route_table_association" "k8s" {

  subnet_id = aws_subnet.k8s.id

  route_table_id = aws_route_table.k8s.id
}


############################################################
# Kubernetes Control Plane
############################################################

resource "aws_instance" "control_plane" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = aws_subnet.k8s.id

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "k8s-control"
    Role = "control-plane"
  }
}


############################################################
# Kubernetes Worker 01
############################################################

resource "aws_instance" "worker01" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = aws_subnet.k8s.id

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

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

  instance_type = var.instance_type

  subnet_id = aws_subnet.k8s.id

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.k8s.id
  ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "k8s-worker02"
    Role = "worker"
  }
}
