# ------------------------------------------------------------------------------
# BEST SHOT - DEMO
# ------------------------------------------------------------------------------
module "best_shot_demo" {
  source      = "./modules/aws-static-site"
  domain_name = "best-shot.demo.${var.domain_name}"
  environment = "demo"
  zone_id     = var.route53_zone_id
}

# ------------------------------------------------------------------------------
# BEST SHOT - STAGING
# ------------------------------------------------------------------------------
module "best_shot_staging" {
  source      = "./modules/aws-static-site"
  domain_name = "best-shot.staging.${var.domain_name}"
  environment = "staging"
  zone_id     = var.route53_zone_id
}

# ------------------------------------------------------------------------------
# BEST SHOT - PRODUCTION
# ------------------------------------------------------------------------------
module "best_shot_production" {
  source      = "./modules/aws-static-site"
  domain_name = "best-shot.${var.domain_name}"
  environment = "production"
  zone_id     = var.route53_zone_id
}

# ------------------------------------------------------------------------------
# OUTPUTS (To be used in GitHub Secrets)
# ------------------------------------------------------------------------------
output "best_shot_demo_bucket_id" {
  value = module.best_shot_demo.s3_bucket_id
}
output "best_shot_demo_cloudfront_id" {
  value = module.best_shot_demo.cloudfront_distribution_id
}

output "best_shot_staging_bucket_id" {
  value = module.best_shot_staging.s3_bucket_id
}
output "best_shot_staging_cloudfront_id" {
  value = module.best_shot_staging.cloudfront_distribution_id
}

output "best_shot_production_bucket_id" {
  value = module.best_shot_production.s3_bucket_id
}
output "best_shot_production_cloudfront_id" {
  value = module.best_shot_production.cloudfront_distribution_id
}
