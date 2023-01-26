# --------------------------
# for CI/CD
# --------------------------
data "aws_iam_user" "circleci" {
  user_name = "circleci-user"
}

# --------------------------
# for CI/CD Github Actions
# --------------------------
resource "aws_iam_user" "github_actions" {
  name = "github-actions"
}

resource "aws_iam_user_policy_attachment" "allow_ecr_access" {
  user       = aws_iam_user.github_actions.name
  policy_arn = data.aws_iam_policy.ecr_full_access.arn
}
resource "aws_iam_user_policy_attachment" "allow_ecs_access" {
  user       = aws_iam_user.github_actions.name
  policy_arn = data.aws_iam_policy.ecs_full_access.arn
}

resource "aws_iam_user_policy_attachment" "allow_cf_access" {
  user       = aws_iam_user.github_actions.name
  policy_arn = data.aws_iam_policy.cf_full_access.arn
}
