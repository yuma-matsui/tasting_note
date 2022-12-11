# --------------------------
# ECS Secrurity Group
# --------------------------
resource "aws_security_group" "ecs_sg" {
  name        = "${var.project}-ecs-sg"
  description = "for ECS"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-ecs-sg"
  }
}

resource "aws_security_group_rule" "ecs_in_http" {
  security_group_id = aws_security_group.ecs_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ecs_in_https" {
  security_group_id = aws_security_group.ecs_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ecs_in_tcp_3000" {
  security_group_id = aws_security_group.ecs_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 3000
  to_port           = 3000
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ecs_out_anywhere" {
  security_group_id = aws_security_group.ecs_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

# --------------------------
# RDS Secrurity Group
# --------------------------
resource "aws_security_group" "rds_sg" {
  name        = "${var.project}-rds-sg"
  description = "for RDS"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-rds-sg"
  }
}

resource "aws_security_group_rule" "rds_in_tcp_5432" {
  security_group_id        = aws_security_group.rds_sg.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 5432
  to_port                  = 5432
  source_security_group_id = aws_security_group.ecs_sg.id
}
