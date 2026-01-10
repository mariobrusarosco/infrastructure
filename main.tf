# ------------------------------------------------------------------------------
# GLOBAL DNS ZONE
# ------------------------------------------------------------------------------
# This resource manages the Route 53 Hosted Zone for "mario.productions".
# We will IMPORT the existing zone into this resource so Terraform manages it.
resource "aws_route53_zone" "main" {
  name = "mario.productions"
}

# ------------------------------------------------------------------------------
# API DNS RECORDS (Railway)
# ------------------------------------------------------------------------------

# Demo Environment
resource "aws_route53_record" "api_demo" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api-best-shot-demo.mario.productions"
  type    = "CNAME"
  ttl     = 300
  records = ["hbsa00bc.up.railway.app"]
}

# Staging Environment
resource "aws_route53_record" "api_staging" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api-best-shot-staging.mario.productions"
  type    = "CNAME"
  ttl     = 300
  records = ["k1s4w9a3.up.railway.app"]
}

# Production Environment
resource "aws_route53_record" "api_production" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api-best-shot.mario.productions"
  type    = "CNAME"
  ttl     = 300
  records = ["api-best-shot-production.up.railway.app"]
}
