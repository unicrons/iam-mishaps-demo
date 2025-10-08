# SNS
sns_allowed_domain = "unicrons.cloud"

# Lambda
lambda_runtime        = "python3.13"
lambda_name           = "unicrons-invocies"
lambda_description    = "unicrons invocies to SNS"
lambda_schedule       = "cron(*/1 * * * ? *)" # every minute
lambda_logs_retention = 1
lambda_handler        = "lambda.publish_message"
lambda_schedule_state = "ENABLED" # "DISABLED"
