# Case 2 - SNS

> Check [USAGE.md](./docs/USAGE.md) to know what is going to be created.

## Setup

1. Modify the [terraform.tfvars](./config/terraform.tfvars) file by adding the value of the variables.

2. Deploy the AWS resources using:
```bash
make plan
make apply
```

## Destroy

To remove all resources use the following command:
```bash
make destroy
```
