module "codebuild_project" {
  source             = "github.com/globeandmail/tf-tgam//codebuild_project"
  name               = "lambda-${var.name}"
  codebuild_role_arn = "${var.codebuild_role_arn}"
  build_image        = "${var.build_image}"

  tags = "${var.tags}"
}

resource "aws_codepipeline" "pipeline" {
  name = "lambda-${var.name}"

  # role_arn = "${aws_iam_role.foo.arn}"
  role_arn = "${var.codepipeline_role_arn}"

  artifact_store {
    # location = "${aws_s3_bucket.foo.bucket}"
    location = "${var.artifact_bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        Owner      = "${var.repo_owner}"
        Repo       = "${var.repo_name}"
        Branch     = "${var.branch_name}"
        OAuthToken = "${var.oauth_token}"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName = "${module.codebuild_project.id}"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy-${var.name}"
      category        = "Invoke"
      owner           = "AWS"
      provider        = "Lambda"
      input_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        FunctionName   = "${var.deploy_function_name}"
        UserParameters = "function_name=${var.name},alias=${var.function_alias}"
      }
    }
  }
}
