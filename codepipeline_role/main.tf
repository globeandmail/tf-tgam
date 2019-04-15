resource "aws_iam_role" "role" {
  name               = "codepipeline-${var.name}"
  assume_role_policy = "${data.aws_iam_policy_document.role.json}"

  tags = "${var.tags}"
}

resource "aws_iam_role_policy" "policy" {
  name   = "codepipeline-${var.name}"
  role   = "${aws_iam_role.role.id}"
  policy = "${file("${path.module}/policy.json")}"
}

data "aws_iam_policy_document" "role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}
