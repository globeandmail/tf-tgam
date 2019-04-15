resource "aws_lambda_function" "lambda" {
  function_name = "${var.function_name}"
  runtime       = "${var.runtime}"
  memory_size   = "${var.memory_size}"
  timeout       = "${var.timeout}"
  role          = "${aws_iam_role.lambda.arn}"
  handler       = "${var.handler}"
  publish       = "${var.publish}"

  // Use empty_function.zip if no other file is specified
  filename = "${length(var.filename) > 0 ? var.filename : "${path.module}/files/empty_function.zip"}"

  environment {
    variables = "${var.env_vars}"
  }

  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }

  tags = "${var.tags}"
}

resource "aws_lambda_alias" "alias" {
  name             = "${var.alias}"
  function_name    = "${aws_lambda_function.lambda.arn}"
  function_version = "${aws_lambda_function.lambda.version}"
}

data "aws_iam_policy_document" "lambda_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "Lambda-${var.function_name}-Role"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_role.json}"

  tags = "${var.tags}"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole" {
  // If no subnet_ids are listed, this isn't in VPC
  count      = "${length(var.subnet_ids) > 0 ? 0 : 1 }"
  role       = "${aws_iam_role.lambda.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaVPCAccessExecutionRole" {
  // If subnet_ids are defined, use the VPC Access Execution Role
  count      = "${length(var.subnet_ids) > 0 ? 1 : 0}"
  role       = "${aws_iam_role.lambda.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = "${var.retention_in_days}"

  tags = "${var.tags}"
}
