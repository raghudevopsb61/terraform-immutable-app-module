resource "aws_lb_target_group" "tg" {
  name     = "${var.ENV}-${var.COMPONENT}"
  port     = var.APP_PORT
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.VPC_ID
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 5
    path                = "/health"
    port                = var.APP_PORT
    timeout             = 3
  }
}
