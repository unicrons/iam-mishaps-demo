resource "aws_cloudwatch_metric_alarm" "lambda_error" {
  alarm_name        = "sh3llcon-invocies-lambda-error"
  alarm_description = "AWS Lambda execution failure"
  metric_name       = "Errors"
  namespace         = "AWS/Lambda"

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  period              = 60
  threshold           = 0
  statistic           = "Sum"
  treat_missing_data  = "ignore"

  dimensions = {
    FunctionName = var.lambda_name
  }

  alarm_actions   = [aws_sns_topic.sh3llcon_monitoring.arn]
  ok_actions      = [aws_sns_topic.sh3llcon_monitoring.arn]
  actions_enabled = true
}
