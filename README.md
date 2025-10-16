# IAM Mishaps Demo
> We're all familiar with the principle of least privilege, but... how easy is it to apply in the cloud? We'll walk you through several AWS IAM case studies, demonstrating just how complex achieving it can be and what the consequences might be.

Originally created for [Sh3llcon 2024 talk](https://sh3llcon.es/programa/). [[Slides]](./Sh3llcon_IAM_policy_mishaps_slides.pdf)
<br><img src="./assets/sh3llcon_talk.png" width="500">

Updated for [AWS UG VLC Meetup](https://www.meetup.com/aws-valencia/events/303501987) with a new case. [[Slides]](./AWSUGVLC_IAM_policy_mishaps_slides.pdf)

Updated for [AWS Community Day CEE 2025](https://awscommunity.eu/). [[Slides]](https://github.com/unicrons/iam-mishaps-demo/blob/main/slides/AWSCEE_IAM_policy_mishaps.pdf)


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

- [Case S3](./case_s3/README.md)

- [Case SNS](./case_sns/README.md)

- [Case Chatbot](./case_chatbot/README.md)

## Blog IAM Series
- [IAM policy mishaps: Intro to IAM](https://unicrons.cloud/en/2024/02/20/iam-policy-mishaps-intro-to-iam/)
- [IAM policy mishaps: S3](https://unicrons.cloud/en/2024/06/01/iam-policy-mishaps-case-1---s3/)
- [IAM policy mishaps: SNS](https://unicrons.cloud/en/2025/02/21/iam-policy-mishaps-case-2---sns/)
- More soon...
