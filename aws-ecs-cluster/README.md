# terraform-aws-ecs-cluster for terraform >= 0.12

This module configures ECS-cluster consisting of number of ec2 instances. It supports spot ec2 instances, which might be
cost effective for a development environment that allows some downtime.

## example

```hcl
module "ecs-cluster" {
  source = "github.com/globeandmail/tf-tgam//aws-ecs-cluster"

  cluster_name       = var.cluster_name
  instance_type      = var.instance_type
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  vpc_id             = var.vpc_id
}
```