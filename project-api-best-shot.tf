# ------------------------------------------------------------------------------
# API BEST SHOT - DEMO
# ------------------------------------------------------------------------------
module "api_best_shot_demo" {
  source         = "./modules/railway-service"
  environment_id = "2772dfea-618e-4c5e-89fd-6f0c8115d906"
  service_id     = "51ec83e0-c00d-4c1a-b428-2186388b8fd3"
  domain_name    = "best-shot.api.demo.${var.domain_name}"
  zone_id        = var.route53_zone_id
}

# ------------------------------------------------------------------------------
# API BEST SHOT - STAGING
# ------------------------------------------------------------------------------
module "api_best_shot_staging" {
  source         = "./modules/railway-service"
  environment_id = "c29790b3-3f2a-4560-a3e8-94909cb7d104"
  service_id     = "51ec83e0-c00d-4c1a-b428-2186388b8fd3"
  domain_name    = "best-shot.api.staging.${var.domain_name}"
  zone_id        = var.route53_zone_id
}

# ------------------------------------------------------------------------------
# API BEST SHOT - PRODUCTION
# ------------------------------------------------------------------------------
module "api_best_shot_production" {
  source         = "./modules/railway-service"
  environment_id = "b15156da-0c9e-41bb-b039-8903ceb1ed87"
  service_id     = "51ec83e0-c00d-4c1a-b428-2186388b8fd3"
  domain_name    = "best-shot.api.${var.domain_name}"
  zone_id        = var.route53_zone_id
}
