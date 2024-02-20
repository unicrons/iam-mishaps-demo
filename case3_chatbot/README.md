# Case 3 - Chatbot

> Check [USAGE.md](./docs/USAGE.md) to know what is going to be created.

## Setup

1. Go to AWS Chatbot console and configure a new Slack client. It will redirect you to slack and will ask for an approval.

2. Modify the [terraform.tfvars](./config/terraform.tfvars) file by adding the value of the variables.
> *Note*: you can get the workspace ID and Channel ID opening slack in a browser

3. Deploy the AWS resources using:
```bash
make plan
make apply
```

## Destroy

To remove all resources use the following command:
```bash
make destroy
```
