data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}

# Role A

resource "aws_iam_role" "role_a" {
  name               = "role-a"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "role_a" {
  role       = aws_iam_role.role_a.name
  policy_arn = aws_iam_policy.role_a.arn
}

resource "aws_iam_policy" "role_a" {
  name   = "role-a"
  policy = data.aws_iam_policy_document.role_policy.json
}

# Role B

resource "aws_iam_role" "role_b" {
  name               = "role-b"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "role_b" {
  role       = aws_iam_role.role_b.name
  policy_arn = aws_iam_policy.role_b.arn
}

resource "aws_iam_policy" "role_b" {
  name   = "role-b"
  policy = data.aws_iam_policy_document.role_policy.json
}

# Role Policy

data "aws_iam_policy_document" "role_policy" {
  statement {
    sid    = "S3"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}
