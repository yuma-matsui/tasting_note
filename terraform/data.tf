# --------------------------
# IAM User for CI/CD
# --------------------------
data "aws_iam_user" "circleci" {
  user_name = "circleci-user"
}
# --------------------------
# Parameter Store for ECS
# --------------------------
data "aws_ssm_parameter" "rails_master_key" {
  name = "tasting-note-masterkey"
}
