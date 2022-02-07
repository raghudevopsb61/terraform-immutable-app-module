resource "aws_launch_template" "foo" {
  name                                 = "foo"
  image_id                             = "ami-test"
  instance_initiated_shutdown_behavior = "terminate"
  instance_market_options {
    market_type = "spot"
  }
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-12345678"]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "test"
    }
  }
  user_data = filebase64("${path.module}/example.sh")
}