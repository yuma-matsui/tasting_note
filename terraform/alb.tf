# --------------------------
# ALB
# --------------------------
resource "aws_lb" "alb" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb_sg.id
  ]
  subnets = [for subnet in aws_subnet.public : subnet.id]
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = aws_acm_certificate.tokyo.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs_target_group_v2.arn
  }
}

resource "aws_lb_listener" "http_to_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# --------------------------
# Target Group v2
# --------------------------
resource "aws_alb_target_group" "ecs_target_group_v2" {
  name        = "${var.project}-ecs-tg-v2"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  health_check {
    healthy_threshold   = 5
    path                = "/api/v1/hello"
    unhealthy_threshold = 2
    protocol            = "HTTP"
    port                = 3000
  }

  tags = {
    Name = "${var.project}-ecs-tg-v2"
  }
}
