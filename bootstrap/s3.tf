resource "aws_s3_bucket" "tfstates" {
  bucket        = "sh3llcon-tfstates"
  force_destroy = "false"

  tags = {
    description = "bucket for storing tfstates"
  }
}

resource "aws_s3_bucket_public_access_block" "tfstates" {
  bucket = aws_s3_bucket.tfstates.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "tfstates" {
  bucket = aws_s3_bucket.tfstates.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}


resource "aws_s3_bucket_versioning" "tfstates" {
  bucket = aws_s3_bucket.tfstates.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstates" {
  bucket = aws_s3_bucket.tfstates.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
