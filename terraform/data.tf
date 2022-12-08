# --------------------------
# Host Zone
# --------------------------
data "aws_route53_zone" "tasting_note" {
  name         = "${var.project}.com"
  private_zone = false
}

# --------------------------
# IAM User for CI/CD
# --------------------------
data "aws_iam_user" "circleci" {
  user_name = "circleci-user"
}