## Example

```hcl
module "codebuild_project" {
  source             = "github.com/globeandmail/tf-tgam//codebuild_project"
  name               = "${var.name}"
  codebuild_role_arn = "${var.codebuild_role_arn}"
  build_image        = "${var.build_image}"

  tags = "${var.tags}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| build\_image | (Required) The image identifier of the Docker image to use for this build project | string | n/a | yes |
| codebuild\_role\_arn | (Required) The ARN of the role that enables CodeBuild to interact with dependent AWS services on behalf of the AWS account | string | n/a | yes |
| name | (Required) The projects name | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| id |  |
