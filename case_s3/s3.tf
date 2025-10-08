resource "aws_s3_bucket" "this" {
  bucket        = var.s3_bucket_name
  force_destroy = "false"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = false # Change to `true` to secure the bucket
  ignore_public_acls      = true
  restrict_public_buckets = false # Change to `true` to secure the bucket
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.this.id
  key    = "flag.txt"
  source = "./flag.txt"
  etag   = filemd5("./flag.txt")
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.bad_policy.json # Comment this line to secure the bucket
  # policy = data.aws_iam_policy_document.good_policy.json # Uncomment this line to secure the bucket
}

data "aws_iam_policy_document" "bad_policy" {
  statement {
    sid    = "Sh3llconPolicy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "aws:PrincipalArn"
      values = [
        aws_iam_role.role_a.arn,
        aws_iam_role.role_b.arn,
      ]
    }
  }
}

data "aws_iam_policy_document" "good_policy" {
  statement {
    sid    = "Sh3llconPolicy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalArn"
      values = [
        aws_iam_role.role_a.arn,
        aws_iam_role.role_b.arn,
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }
}
