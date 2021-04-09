resource "aws_instance" "nat-instance" {
  ami = lookup(var.nat-amis, var.region)
  instance_type = var.instance-type
  source_dest_check = false
  subnet_id = aws_subnet.public-subnet.id
  security_groups = [aws_security_group.public-sg.id]
  tags = {
    Name = "NAT-Instance"
  }
}
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = var.open
    instance_id = aws_instance.nat-instance.id
  }
  tags = {
    Name = "Pvt-RT"
  }
}
resource "aws_route_table_association" "prv-route-table-asso" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-subnet.id
}

resource "aws_instance" "private-instance" {
  ami = lookup(var.amis, var.region)
  instance_type = var.instance-type
  subnet_id = aws_subnet.private-subnet.id
  security_groups = [aws_security_group.private-sg.id]
  key_name = aws_key_pair.my-aws-keys.key_name
  tags = {
    Name = "Private-Instance"
  }
}