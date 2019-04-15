## Example

```hcl
module "codebuild_role" {
  source = "github.com/globeandmail/tf-tgam//codebuild_role"

  name            = "${var.name}"
  artifact_bucket = "${var.artifact_bucket}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artifact\_bucket | (Required) The name of the S3 bucket that codebuild will store build artifacts | string | n/a | yes |
| name | (Required) The name used to identify the codebuild role and policy | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn |  |
