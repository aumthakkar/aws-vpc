variable "region" {
  default = "eu-west-2"
}
variable "public-key-path" {
  default = "awskey.pub"
}
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}
variable "public-subnet-cidr" {
  default = "10.0.1.0/24"
}
variable "private-subnet-cidr" {
  default = "10.0.2.0/24"
}
variable "open" {
  default = "0.0.0.0/0"
}
variable "my-pc-cidr" {
  default = "92.2.114.69/32"
}
variable "instance-type" {
  default = "t2.micro"
}

variable "amis" {
  default = {
    eu-west-2="ami-098828924dc89ea4a"
    us-east-1="ami-047a51fa27710816e"
  }
}
variable "nat-amis" {
  default = {
    eu-west-2 = "ami-00fe444797752bd96"
    us-east-1 = "ami-00a9d4a05375b2763"
  }
}
