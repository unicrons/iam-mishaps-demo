# IAM Mishaps Demo

# Cases

## Resources

To check the resources that are goint to be created for each case check the `USAGE.md` file under `docs/` folder.

## Requirements

- An AWS Account: to deploy demo resources you will need an AWS account
  > All resources are included in the free tier if you don't abouse the requests

- Each case stores the tfstate in a S3 bucket to allow, to create that tfstates bucket deploy it using: 
  ```bash
  cd bootstrap/
  make plan
  make apply
  ```

## Deploy it

- [Case 1 - S3](./case1_s3/README.md)

- [Case 2 - SNS](./case2_sns/README.md)

- [Case 3 - Chatbot](./case3_chatbot/README.md)
