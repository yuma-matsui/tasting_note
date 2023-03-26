# --------------------------
# Host Zone
# --------------------------
data "aws_route53_zone" "tasting_note" {
  name         = "${var.project}.com"
  private_zone = false
}

# --------------------------
# A record for Cloudfront Web Hosting
# --------------------------
resource "aws_route53_record" "cloudfront" {
  zone_id = data.aws_route53_zone.tasting_note.zone_id
  name    = "${var.project}.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf.domain_name
    zone_id                = aws_cloudfront_distribution.cf.hosted_zone_id
    evaluate_target_health = true
  }
}

# --------------------------
# A record for ALB
# --------------------------
resource "aws_route53_record" "alb" {
  zone_id = data.aws_route53_zone.tasting_note.zone_id
  name    = "api.${var.project}.com"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}

# --------------------------
# A record for Cloudfront Images
# --------------------------
resource "aws_route53_record" "cf_images" {
  zone_id = data.aws_route53_zone.tasting_note.zone_id
  name    = "images.${var.project}.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf_images.domain_name
    zone_id                = aws_cloudfront_distribution.cf_images.hosted_zone_id
    evaluate_target_health = true
  }
}
