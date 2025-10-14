variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "sns_allowed_domain" {
  type        = string
  description = "Email to allow SNS subscriptions"
}

variable "lambda_name" {
  type        = string
  description = "Lambda name"
}

variable "lambda_description" {
  type        = string
  description = "Lambda description"
}

variable "lambda_runtime" {
  type        = string
  description = "AWS Lambda Runtime. https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html"
}

variable "lambda_architecture" {
  type        = string
  description = "AWS Lambda architecture"
  default     = "arm64"
}

variable "lambda_schedule" {
  type        = string
  description = "AWS CloudWatch Lambda Trigger Scheduled expressions. https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html"
}

variable "lambda_logs_retention" {
  type        = number
  description = "Number of days to keep lambda logs"

  validation {
    condition     = contains([0, 1, 3, 5, 7, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653], var.lambda_logs_retention)
    error_message = "Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0."
  }
}

variable "lambda_handler" {
  type        = string
  description = "Lambda handler"
}

variable "lambda_schedule_state" {
  type        = string
  description = "Lambda eventbridge rule state"
}
