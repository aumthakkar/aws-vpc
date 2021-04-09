resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "My-VPC"
  }
}
terraform {
  backend "s3" {
    region = "eu-west-2"
    key = "vpc/terraform.tfstate"
    bucket = "pranav-terraform-s3-bucket"
  }
}
resource "aws_subnet" "public-subnet" {
  cidr_block = var.public-subnet-cidr
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet"
  }
}
resource "aws_subnet" "private-subnet" {
  cidr_block = var.private-subnet-cidr
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "${var.region}b"
}
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "My-IGW"
  }
}
resource "aws_route_table" "my-public-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = var.open
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name = "Public-RT"
  }
}
resource "aws_route_table_association" "pub-route-table-asso" {
  route_table_id = aws_route_table.my-public-route-table.id
  subnet_id = aws_subnet.public-subnet.id
}

