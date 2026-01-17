terraform {
  backend "s3" {
    bucket         = "mario-productions-terraform-state"
    key            = "main/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "mario-productions-terraform-locks"
    encrypt        = true
  }
}
