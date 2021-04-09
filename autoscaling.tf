resource "aws_launch_configuration" "my-launch-config" {
  image_id = lookup(var.amis, var.region)
  instance_type = var.instance-type
  name = "My-Launch-Config"
  security_groups = [aws_security_group.public-sg.id]
  key_name = aws_key_pair.my-aws-keys.key_name
  user_data = "#!/bin/bash\nyum update -y\nyum install httpd -y\nsystemctl start httpd\ncd /var/www/html\n echo '<html><h1> Hello from Pranav! </h1></html>' >>index.html"
}
resource "aws_autoscaling_group" "my-asg" {
  max_size = 1
  min_size = 1
  name = "My-ASG"
  launch_configuration = aws_launch_configuration.my-launch-config.name
  health_check_type = "ELB"
  health_check_grace_period = 300
  load_balancers = [aws_elb.my-elb.name]
  vpc_zone_identifier = [aws_subnet.public-subnet.id]
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "EC2-Fleet"
  }
}

