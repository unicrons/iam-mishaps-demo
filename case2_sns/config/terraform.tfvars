# SNS
sns_allowed_domain = "sh3llcon.es"

# Lambda
lambda_runtime        = "python3.12"
lambda_name           = "sh3llcon-invocies"
lambda_description    = "sh3llcon invocies to SNS"
lambda_schedule       = "cron(*/1 * * * ? *)"
lambda_logs_retention = 1
lambda_handler        = "lambda.publish_message"
lambda_schedule_state = "ENABLED" # "DISABLED"
