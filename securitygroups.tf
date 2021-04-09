resource "aws_security_group" "public-sg" {
  name = "Public-SG"
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "Public-SG"
  }
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = [var.my-pc-cidr]
  }
  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = [var.open]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [var.open]
  }
}

resource "aws_security_group" "private-sg" {
  vpc_id = aws_vpc.my-vpc.id
  name = "Private-SG"
  tags = {
    Name = "Private-SG"
  }
  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    security_groups = [aws_security_group.public-sg.id]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [var.open]
  }
}