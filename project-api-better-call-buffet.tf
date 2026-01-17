# ------------------------------------------------------------------------------
# BETTER CALL BUFFET API - PRODUCTION
# ------------------------------------------------------------------------------
module "api_better_call_buffet_production" {
  source         = "./modules/railway-service"
  environment_id = "c5583046-35d3-478a-b759-1f0180b35ec4"
  service_id     = "746dca97-f7bd-414e-91a0-572cf1a011b8"
  domain_name    = "better-call-buffet.api.${var.domain_name}"
  zone_id        = var.route53_zone_id
}
