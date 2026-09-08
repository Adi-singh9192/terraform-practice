output "cloudfront_domain_name" {
  description = "cloudfront distribution domain name"
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}