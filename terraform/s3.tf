# --------------------------
# S3 Web Hosting
# --------------------------
resource "aws_s3_bucket" "web_hosting" {
  bucket = var.project
}

resource "aws_s3_bucket_website_configuration" "tasting_note" {
  bucket = aws_s3_bucket.web_hosting.bucket
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "web_hosting" {
  bucket                  = aws_s3_bucket.web_hosting.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket_policy.web_hosting
  ]
}

resource "aws_s3_bucket_policy" "web_hosting" {
  bucket = aws_s3_bucket.web_hosting.id
  policy = data.aws_iam_policy_document.s3_web_hosting.json
}

data "aws_iam_policy_document" "s3_web_hosting" {
  statement {
    sid       = "AllowCloudFrontServicePrincipal"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_hosting.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cf_s3_origin_access_identity.iam_arn]
    }
  }
  statement {
    sid    = "AllowGithubActionsAutoDeploy"
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:ListBucket",
      "s3:DeleteObject"
    ]
    resources = [
      "${aws_s3_bucket.web_hosting.arn}",
      "${aws_s3_bucket.web_hosting.arn}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.github_actions.arn]
    }
  }
}

# --------------------------
# S3 for Images
# --------------------------
resource "aws_s3_bucket" "images" {
  bucket = "${var.project}-images"
}

resource "aws_s3_bucket_public_access_block" "images" {
  bucket                  = aws_s3_bucket.images.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on = [
    aws_s3_bucket_policy.images
  ]
}

resource "aws_s3_bucket_policy" "images" {
  bucket = aws_s3_bucket.images.id
  policy = data.aws_iam_policy_document.s3_images.json
}

data "aws_iam_policy_document" "s3_images" {
  statement {
    sid       = "AllowCloudFrontServicePrincipal"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.images.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cf_s3_images_origin_access_identity.iam_arn]
    }
  }
}
