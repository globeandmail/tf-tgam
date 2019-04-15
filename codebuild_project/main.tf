resource "aws_codebuild_project" "project" {
  name          = "${var.name}"
  build_timeout = "60"
  service_role  = "${var.codebuild_role_arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "${var.build_image}"
    type         = "LINUX_CONTAINER"
  }

  source {
    type = "CODEPIPELINE"
  }

  tags = "${var.tags}"
}

resource "aws_cloudwatch_log_group" "group" {
  name              = "/aws/codebuild/${var.name}"
  retention_in_days = 14

  tags = "${var.tags}"
}
