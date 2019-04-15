## Example

```hcl
module "function" {
  source = "github.com/globeandmail/tf-tgam//lambda_function"

  function_name      = "${var.function_name}"
  handler            = "lambda_function.lambda_handler"
  runtime            = "python3.7"
  memory_size        = "128"
  env_vars           = "${var.lambda_vars}"
  subnet_ids         = ["${var.subnets}"]
  security_group_ids = ["${var.security_groups}"]
  tags               = "${var.tags}"
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alias | Creates an alias that points to the specified Lambda function version | string | `"live"` | no |
| env\_vars | (Optional) A map that defines environment variables for the Lambda function. | map | `<map>` | no |
| filename | The zip file to upload containing the function code | string | `""` | no |
| function\_name | (Required) A unique name for your Lambda Function | string | n/a | yes |
| handler | (Required) The function entrypoint in your code | string | n/a | yes |
| memory\_size | (Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128 | string | `"128"` | no |
| publish | (Optional) Whether to publish creation/change as new Lambda Function Version. | string | `"true"` | no |
| retention\_in\_days | Default value for this functions cloudwatch logs group | string | `"14"` | no |
| runtime | (Required) See https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html for valid values. | string | n/a | yes |
| security\_group\_ids | (Optional) Required for running the Lambda function in a VPC | list | `<list>` | no |
| subnet\_ids | (Optional) Required for running the Lambda function in a VPC | list | `<list>` | no |
| tags | AWS Resource tags | map | n/a | yes |
| timeout | (Optional) The amount of time your Lambda Function has to run in seconds. Defaults to 3 | string | `"3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| function\_arn | The ARN of the function created |
| function\_name | The name of the function created |
| role\_arn | The ARN of the role created |
| role\_id | The name of the role created |
