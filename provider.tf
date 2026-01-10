terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Default Region (Ohio)
provider "aws" {
  region = "us-east-2"
}

# Virginia Region (for Global Resources like ACM/WAF)
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
