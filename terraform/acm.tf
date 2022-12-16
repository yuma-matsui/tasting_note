# --------------------------
# Tokyo
# --------------------------
resource "aws_acm_certificate" "tokyo" {
  domain_name               = "${var.project}.com"
  subject_alternative_names = ["api.${var.project}.com"]
  validation_method         = "DNS"

  tags = {
    Name = "${var.project}-sslcert-tokyo"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "tokyo_cert_dns_resolve" {
  for_each = {
    for dvo in aws_acm_certificate.tokyo.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.tasting_note.zone_id
}

resource "aws_acm_certificate_validation" "tokyo_cert_valid" {
  certificate_arn         = aws_acm_certificate.tokyo.arn
  validation_record_fqdns = [for record in aws_route53_record.tokyo_cert_dns_resolve : record.fqdn]
}

# --------------------------
# Virginia
# --------------------------
resource "aws_acm_certificate" "virginia" {
  provider = aws.virginia

  domain_name       = "${var.project}.com"
  validation_method = "DNS"

  tags = {
    Name = "${var.project}-sslcert-virginia"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "virginia_cert_dns_resolve" {
  for_each = {
    for dvo in aws_acm_certificate.virginia.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.tasting_note.zone_id
}

resource "aws_acm_certificate_validation" "cert_valid" {
  provider                = aws.virginia
  certificate_arn         = aws_acm_certificate.virginia.arn
  validation_record_fqdns = [for record in aws_route53_record.virginia_cert_dns_resolve : record.fqdn]
}
