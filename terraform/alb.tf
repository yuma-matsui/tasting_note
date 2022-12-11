# --------------------------
# ALB
# --------------------------
resource "aws_lb" "alb" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.ecs_sg.id
  ]
  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1c.id
  ]
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = aws_acm_certificate.tokyo.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs_target_group.arn
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
# Target Group
# --------------------------
resource "aws_alb_target_group" "ecs_target_group" {
  name        = "${var.project}-ecs-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  tags = {
    Name = "${var.project}-ecs-tg"
  }
}
# --------------------------
# Route53 A Record
# --------------------------
resource "aws_route53_record" "alb" {
  zone_id = data.aws_route53_zone.tasting_note.zone_id
  name    = "api.${var.project}.com"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
