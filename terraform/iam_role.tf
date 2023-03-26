# -------------------------------
# IAM Role for ecs task execution
# -------------------------------
resource "aws_iam_role" "ecs_task_execution" {
  name               = "TastingNoteEcsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json
}

data "aws_iam_policy_document" "ecs_task_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = aws_iam_policy.ecs_task_execution.arn
}

# -------------------------------
# IAM Role for ecs task role
# -------------------------------
resource "aws_iam_role" "ecs_task" {
  name               = "TastingNoteEcsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_task" {
  role       = aws_iam_role.ecs_task.name
  policy_arn = data.aws_iam_policy.s3_full_access.arn
}
