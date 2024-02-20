data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["chatbot.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "awschatbot" {
  name               = "sh3llcon-awschatbot"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "awschatbot" {
  role       = aws_iam_role.awschatbot.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
