## Example
```hcl
module "deploy_lambda" {
  source          = "github.com/globeandmail/tf-tgam//pipeline_lambda_deploy"

  name            = "${var.function_name}"
  build_image     = "${var.build_image}"
  repo_owner      = "${var.repo_owner}"
  repo_name       = "${var.repo_name}"
  oauth_token     = "${var.oauth_token}"
  artifact_bucket = "${var.artifact_bucket}"

  codebuild_role_arn    = "${var.codebuild_role_arn}"
  codepipeline_role_arn = "${var.codepipeline_role_arn}"

  tags = "${var.tags}"
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artifact\_bucket | (Required) The name of the S3 bucket that codebuild will store build artifacts | string | n/a | yes |
| branch\_name | (Optional) The git branch name to use for the codebuild project | string | `"master"` | no |
| build\_image | (Required) The image identifier of the Docker image to use for this build project | string | n/a | yes |
| codebuild\_role\_arn | (Required) The ARN of the role that enables CodeBuild to interact with dependent AWS services on behalf of the AWS account | string | n/a | yes |
| codepipeline\_role\_arn | (Required) The ARN of the role that enables CodePipeline to interact with dependent AWS services on behalf of the AWS account | string | n/a | yes |
| deploy\_function\_name | (Optional) The name of the Lambda function in the account that will update the function code | string | `"CodepipelineDeploy"` | no |
| function\_alias | (Optional) The name of the Lambda function alias that gets passed to the UserParameters data in the deploy stage | string | `"live"` | no |
| name | (Required) The name to be used for the codepipepline and codebuild projects | string | n/a | yes |
| oauth\_token | (Required) The generated oath token from github | string | n/a | yes |
| repo\_name | (Required) The name of the github repository | string | n/a | yes |
| repo\_owner | (Required) The name of the github username or company that owns the repository | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource | map | `<map>` | no |
