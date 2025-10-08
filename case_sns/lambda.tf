resource "aws_lambda_function" "this" {
  runtime          = var.lambda_runtime
  function_name    = var.lambda_name
  description      = var.lambda_description
  filename         = "lambda_function_payload.zip"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  handler          = var.lambda_handler
  role             = aws_iam_role.this.arn
  architectures    = [var.lambda_architecture]

  environment {
    variables = {
      SNS_ARN = aws_sns_topic.invoices_notify.arn
    }
  }
}

resource "aws_cloudwatch_event_rule" "scheduled" {
  name                = "${aws_lambda_function.this.function_name}-schedule"
  description         = "${aws_lambda_function.this.function_name}-schedule"
  schedule_expression = var.lambda_schedule
  state               = var.lambda_schedule_state
}

resource "aws_cloudwatch_event_target" "scheduled" {
  rule      = aws_cloudwatch_event_rule.scheduled.name
  target_id = "lambda"
  arn       = aws_lambda_function.this.arn
}

resource "aws_lambda_permission" "scheduled" {
  statement_id  = "AllowExecutionFromCloudWatchSchedule"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduled.arn
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./code/lambda.py"
  output_path = "lambda_function_payload.zip"
}
