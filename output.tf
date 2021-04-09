output "elb-dns" {
  value = aws_elb.my-elb.dns_name
}