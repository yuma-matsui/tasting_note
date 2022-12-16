# --------------------------
# for CI/CD
# --------------------------
data "aws_iam_user" "circleci" {
  user_name = "circleci-user"
}
