terraform {
  required_providers {
    netlify = {
      source = "netlify/netlify"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# NOTE: The netlify_site_domain_settings resource is currently disabled
# due to a bug in the Netlify provider (~> 0.1.0) that causes a crash 
# during read/import (required property 'password' error).
#
# Registering the custom domain must be done once manually in the Netlify UI.
# ------------------------------------------------------------------------------
# resource "netlify_site_domain_settings" "this" {
#   site_id       = var.site_id
#   custom_domain = var.custom_domain
# }

# 2. Point Route 53 to the Netlify site
resource "aws_route53_record" "cname" {
  zone_id = var.zone_id
  name    = var.custom_domain
  type    = "CNAME"
  ttl     = 300
  records = ["better-call-buffet.netlify.app"]
}
