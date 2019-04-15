## Example

```hcl
module "scheduled_function" {
  source = "github.com/globeandmail/tf-tgam//cloudwatch_event_lambda"

  function_name       = "${var.function_name}"
  function_arn        = "${var.function_arn}"
  schedule_expression = "rate(1 minute)"

  tags = "${var.tags}"
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| function\_arn | (Required) The Amazon Resource Name (ARN) of the Lambda Function | string | n/a | yes |
| function\_name | (Required) The name fo the Lambda Function | string | n/a | yes |
| schedule\_expression | (Required) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes) | string | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Description |
