resource "aws_launch_template" "LT" {
  name = var.cluster_name

  dynamic instance_market_options {
    for_each = var.spot ? [1] : []

    content {
      market_type = "spot"
    }
  }

  credit_specification {
    cpu_credits = var.cpu_unlimited ? "unlimited" : "standard"
  }

  image_id               = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2-instance-role.arn
  }

  key_name   = var.ec2_key_name
  user_data  = data.template_cloudinit_config.config.rendered
  depends_on = [aws_iam_instance_profile.ec2-instance-role]
}

resource "aws_autoscaling_group" "ASG" {
  name                 = var.cluster_name
  max_size             = var.instances_desired
  min_size             = var.instances_desired
  desired_capacity     = var.instances_desired
  force_delete         = true
  vpc_zone_identifier  = var.subnet_ids
  termination_policies = ["OldestInstance"]

  launch_template {
    id      = aws_launch_template.LT.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-ecs"
    propagate_at_launch = true
  }

  tag {
    key                 = "ecs-cluster"
    value               = var.cluster_name
    propagate_at_launch = true
  }

  depends_on = [aws_iam_instance_profile.ec2-instance-role]
}

resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}
