resource "aws_key_pair" "my-aws-keys" {
  key_name = "awskey"
  public_key = file(var.public-key-path)
}