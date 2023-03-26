# --------------------------
# Cloudfront for S3 Web Hosting
# --------------------------
resource "aws_cloudfront_distribution" "cf" {
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.web_hosting.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.web_hosting.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cf_s3_origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.web_hosting.id

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 403
    response_page_path    = "/"
    response_code         = 403
  }

  aliases = ["${var.project}.com"]

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.virginia.arn
    minimum_protocol_version = "TLSv1.2_2019"
    ssl_support_method       = "sni-only"
  }
}

resource "aws_cloudfront_origin_access_identity" "cf_s3_origin_access_identity" {
  comment = "s3 web hosting bucket access identity"
}

# --------------------------
# Cloudfront for S3 images
# --------------------------
resource "aws_cloudfront_distribution" "cf_images" {
  enabled         = true
  is_ipv6_enabled = true
  price_class     = "PriceClass_All"

  origin {
    domain_name = aws_s3_bucket.images.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.images.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cf_s3_images_origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.images.id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = ["images.${var.project}.com"]

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.virginia.arn
    minimum_protocol_version = "TLSv1.2_2019"
    ssl_support_method       = "sni-only"
  }
}

resource "aws_cloudfront_origin_access_identity" "cf_s3_images_origin_access_identity" {
  comment = "s3 images bucket access identity"
}
