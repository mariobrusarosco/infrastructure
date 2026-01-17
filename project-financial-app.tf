# ------------------------------------------------------------------------------
# FINANCIAL APP (Better Call Buffet)
# ------------------------------------------------------------------------------
module "financial_app" {
  source        = "./modules/netlify-site"
  site_id       = "40a401e9-02c8-4208-afc9-ce9a21d841ac"
  custom_domain = "better-call-buffet.${var.domain_name}"
  zone_id       = var.route53_zone_id
}
