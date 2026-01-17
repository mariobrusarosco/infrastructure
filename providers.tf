provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "MarioProductions"
      ManagedBy = "Terraform"
      Repo      = "infrastructure"
    }
  }
}

provider "netlify" {
  token = var.netlify_token
}

provider "railway" {
  token = var.railway_token
}

# provider "vercel" {
#   api_token = var.vercel_token
#   team      = "team_aQ38ShhjD4XdfzlJiHidEq4R"
# }
