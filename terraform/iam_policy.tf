# -------------------
# ecs task execution
# -------------------
resource "aws_iam_policy" "ecs_task_execution" {
  name        = "TastingNoteEcsTaskExecutionPolicy"
  description = "Allow ecs task execution and ssm get parameters."
  policy      = data.aws_iam_policy_document.ecs_task_policy.json
}

data "aws_iam_policy_document" "ecs_task_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ssm:GetParameters",
      "kms:Decrypt"
    ]
    resources = ["*"]
  }
}

# -------------------
# ecr full access
# -------------------
data "aws_iam_policy" "ecr_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

# -------------------
# ecs full access
# -------------------
data "aws_iam_policy" "ecs_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

# -----------------------
# cloud front full access
# -----------------------
data "aws_iam_policy" "cf_full_access" {
  arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

# -----------------------
# S3 full access
# -----------------------
data "aws_iam_policy" "s3_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
