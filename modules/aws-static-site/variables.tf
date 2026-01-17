variable "domain_name" {
  description = "The domain name for the website (e.g., app.mario.productions)"
  type        = string
}

variable "environment" {
  description = "The environment (demo, staging, production)"
  type        = string
}

variable "zone_id" {
  description = "The Route 53 Hosted Zone ID"
  type        = string
}
