Creates the following.

* Application Load Balancer
*

## Example

```hcl
module "alb" {
  source = "github.com/globeandmail/tf-tgam//alb_lambda"

  name            = "${var.name}"
  internal        = false
  subnets         = ["${var.subnets}"]
  http_server     = true
  https_server    = true
  security_groups = ["${var.security_group}"]
  function_arn    = "${var.function_arn}"
  certificate_arn = "${var.certificate_arn}"

  enable_deletion_protection = true

  tags = "${var.tags}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| certificate\_arn | (Optional) The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS | string | n/a | yes |
| enable\_deletion\_protection | (Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer | string | `"true"` | no |
| function\_arn | (Reqired) The ARN identifying your Lambda Function | string | n/a | yes |
| http\_server | (Optional) If set to true, create the HTTP listner on port 80 | string | `"false"` | no |
| https\_server | (Optional) If set to true, create an HTTPS listner on port 443 | string | `"false"` | no |
| internal | (Optional) If true, the LB will be internal. | string | `"false"` | no |
| name | (Reqired) The name identifying the load balamcer and target group(s) | string | n/a | yes |
| security\_groups | (Reqired) A list of security group IDs to assign to the LB | list | n/a | yes |
| ssl\_policy | (Optional) The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS | string | `"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"` | no |
| subnets | (Reqired) A list of subnet IDs to attach to the LB | list | n/a | yes |
| tags | (Optional) A mapping of tags to assign to the resource | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Description |
