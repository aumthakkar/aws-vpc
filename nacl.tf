resource "aws_network_acl" "my-nacl" {
  vpc_id = aws_vpc.my-vpc.id
  subnet_ids = [aws_subnet.public-subnet.id]
  tags = {
    Name = "My NACL"
  }
  ingress {
    action = "allow"
    from_port = 1024
    protocol = "tcp"
    rule_no = 100
    to_port = 65535
    cidr_block = var.open
  }
  ingress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 200
    to_port = 80
    cidr_block = var.open
  }
  ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 300
    to_port = 22
    cidr_block = var.my-pc-cidr
  }
  egress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    rule_no = 100
    to_port = 22
    cidr_block = var.open
  }
  egress {
    action = "allow"
    from_port = 1024
    protocol = "tcp"
    rule_no = 200
    to_port = 65535
    cidr_block = var.open
  }
  egress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    rule_no = 300
    to_port = 80
    cidr_block = var.open
  }
}
