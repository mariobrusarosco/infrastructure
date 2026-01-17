variable "site_id" {
  description = "The Netlify Site ID"
  type        = string
}

variable "custom_domain" {
  description = "The custom domain for the site (e.g., financial.mario.productions)"
  type        = string
}

variable "zone_id" {
  description = "The AWS Route53 Zone ID"
  type        = string
}
