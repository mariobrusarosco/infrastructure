variable "domain_name" {
  description = "The root domain name for all projects"
  type        = string
  default     = "mario.productions"
}

variable "route53_zone_id" {
  description = "The Route 53 Hosted Zone ID for mario.productions"
  type        = string
  default     = "Z04955823HLJB9D4I2QWR"
}

variable "railway_token" {
  description = "Railway API Token"
  type        = string
  sensitive   = true
}

variable "netlify_token" {
  description = "Netlify API Token"
  type        = string
  sensitive   = true
}

variable "vercel_token" {
  description = "Vercel API Token"
  type        = string
  sensitive   = true
}

variable "vercel_team_id" {
  description = "Vercel Team ID"
  type        = string
  default     = "team_aQ38ShhjD4XdfzlJiHidEq4R"
}
