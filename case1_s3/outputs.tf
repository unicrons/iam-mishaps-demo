output "s3_bucket_name" {
  value = aws_s3_bucket.this.id
}

output "s3_bucket_endpoint" {
  value = aws_s3_bucket.this.bucket_domain_name
}
