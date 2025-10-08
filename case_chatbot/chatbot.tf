resource "awscc_chatbot_slack_channel_configuration" "sh3llcon_monitoring" {
  configuration_name = "sh3llcon-monitoring"
  iam_role_arn       = aws_iam_role.awschatbot.arn
  guardrail_policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  slack_workspace_id = var.slack_workspace_id
  slack_channel_id   = var.slack_channel_id
  sns_topic_arns     = [aws_sns_topic.sh3llcon_monitoring.arn]
  user_role_required = false
  logging_level      = "NONE"
}
