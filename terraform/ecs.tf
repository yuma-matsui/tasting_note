# --------------------------
# Cluster
# --------------------------
resource "aws_ecs_cluster" "tasting_note" {
  name = "${var.project}-cluster"
}

# --------------------------
# task difinition
# --------------------------
resource "aws_ecs_task_definition" "rails_task" {
  family                   = "${var.project}-task"
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task.arn

  container_definitions = templatefile("./task_definitions/rails_container_definitions.json", {
    project               = var.project
    image                 = aws_ecr_repository.tasting_note.repository_url
    aws_ssm_parameter_arn = data.aws_ssm_parameter.rails_master_key.arn
  })
}

# --------------------------
# service v2
# --------------------------
resource "aws_ecs_service" "tasting_note_v2" {
  name                              = "${var.project}-service-v2"
  cluster                           = aws_ecs_cluster.tasting_note.arn
  task_definition                   = aws_ecs_task_definition.rails_task.arn
  desired_count                     = 2
  launch_type                       = "FARGATE"
  platform_version                  = "1.4.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = [for subnet in aws_subnet.public : subnet.id]
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ecs_target_group_v2.arn
    container_name   = "${var.project}-container"
    container_port   = 3000
  }

  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }
}
