variable "environment_id" {
  description = "The Railway Environment ID"
  type        = string
}

variable "service_id" {
  description = "The Railway Service ID"
  type        = string
}

variable "domain_name" {
  description = "The full custom domain name (e.g. api.best-shot.mario.productions)"
  type        = string
}

variable "zone_id" {
  description = "The AWS Route53 Zone ID"
  type        = string
}
