terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# 1. Add Domain to Vercel Project (DISABLED TEMPORARILY TO CLEAR DNS)
# resource "vercel_project_domain" "this" {
#   project_id = var.project_id
#   domain     = var.domain_name
# }

# 2. DNS Record in Route 53
resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = var.domain_name == "mario.productions" ? "A" : "CNAME"
  ttl     = 300
  records = var.domain_name == "mario.productions" ? ["76.76.21.21"] : ["cname.vercel-dns.com"]
}

# 3. Create WWW CNAME Record ONLY if it is the apex domain
resource "aws_route53_record" "www" {
  count   = var.domain_name == "mario.productions" ? 1 : 0
  zone_id = var.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = ["cname.vercel-dns.com"]
}
