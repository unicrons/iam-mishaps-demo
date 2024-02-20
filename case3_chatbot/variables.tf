variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "slack_workspace_id" {
  type        = string
  description = "Slack Workspace ID to be used by ChatBot"
}

variable "slack_channel_id" {
  type        = string
  description = "Slack Channel ID to send ChatBot content"
}

variable "lambda_name" {
  type        = string
  description = "Cloudwatch alert lambda name"
}
