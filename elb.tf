resource "aws_elb" "my-elb" {
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    interval = 30
    target = "HTTP:80/index.html"
    timeout = 3
    unhealthy_threshold = 2
  }
  security_groups = [aws_security_group.public-sg.id]
  subnets = [aws_subnet.public-subnet.id]
}