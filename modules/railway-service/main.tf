terraform {
  required_providers {
    railway = {
      source = "terraform-community-providers/railway"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# 1. Register the Custom Domain in Railway
resource "railway_custom_domain" "this" {
  service_id     = var.service_id
  environment_id = var.environment_id
  domain         = var.domain_name
}

# 2. Create the CNAME record in AWS Route 53 pointing to Railway's validation target
resource "aws_route53_record" "cname" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "CNAME"
  ttl     = 300
  records = [railway_custom_domain.this.dns_record_value]
}
