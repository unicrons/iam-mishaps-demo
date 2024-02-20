data "aws_iam_policy_document" "assume_lambda" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.lambda_name}-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_lambda.json
}

resource "aws_iam_policy" "lambda" {
  name   = "${var.lambda_name}-lambda"
  policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.lambda.arn
}

data "aws_iam_policy_document" "lambda" {
  statement {
    sid    = "CWLogging"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["${aws_cloudwatch_log_group.lambda.arn}:log-stream:*"]
  }
  statement {
    sid    = "SNS"
    effect = "Allow"
    actions = [
      "sns:Publish",
    ]
    resources = [
      aws_sns_topic.invoices_notify.arn
    ]
  }
}
