resource "awscc_chatbot_slack_channel_configuration" "unicrons_monitoring" {
  configuration_name = "unicrons-monitoring"
  iam_role_arn       = aws_iam_role.awschatbot.arn
  guardrail_policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  slack_workspace_id = var.slack_workspace_id
  slack_channel_id   = var.slack_channel_id
  sns_topic_arns     = [aws_sns_topic.unicrons_monitoring.arn]
  user_role_required = false
  logging_level      = "NONE"
}
