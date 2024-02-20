resource "aws_sns_topic" "invoices_notify" {
  name              = "sh3llcon-invoices"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_policy" "invoices_notify" {
  arn    = aws_sns_topic.invoices_notify.arn
  policy = data.aws_iam_policy_document.invoices_notify.json
}

data "aws_iam_policy_document" "invoices_notify" {
  statement {
    sid    = "default_policy"
    effect = "Allow"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"

      values = [
        data.aws_caller_identity.current.account_id
      ]
    }

    resources = [
      aws_sns_topic.invoices_notify.arn,
    ]
  }

  statement {
    sid     = "email_subscription"
    effect  = "Allow"
    actions = ["sns:Subscribe"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringLike"
      variable = "SNS:Endpoint"

      values = [
        "*@${var.sns_allowed_domain}"
      ]
    }

    # condition { # Uncomment this to secure the topic
    #   test     = "StringEquals"
    #   variable = "sns:Protocol"
    #   values   = ["email"]
    # }

    resources = [
      aws_sns_topic.invoices_notify.arn,
    ]
  }
}
