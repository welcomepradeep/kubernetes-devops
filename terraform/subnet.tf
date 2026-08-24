############################################################
# Kubernetes Public Subnet
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
