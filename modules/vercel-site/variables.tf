variable "project_id" {
  description = "The Vercel Project ID"
  type        = string
}

variable "domain_name" {
  description = "The root domain (e.g. mario.productions)"
  type        = string
}

variable "zone_id" {
  description = "The AWS Route53 Zone ID"
  type        = string
}
