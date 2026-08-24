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
