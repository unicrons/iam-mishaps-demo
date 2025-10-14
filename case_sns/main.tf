provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      application = "unicrons-mishaps-demo"
    }
  }
}
