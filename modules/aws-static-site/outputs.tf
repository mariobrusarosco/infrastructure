output "s3_bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.website_bucket.arn
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
