## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.33.0 |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | 0.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.lambda_error](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_role.awschatbot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.awschatbot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.sh3llcon_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [awscc_chatbot_slack_channel_configuration.sh3llcon_monitoring](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/chatbot_slack_channel_configuration) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | Cloudwatch alert lambda name | `string` | n/a | yes |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id) | Slack Channel ID to send ChatBot content | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | Slack Workspace ID to be used by ChatBot | `string` | n/a | yes |

## Outputs

No outputs.
