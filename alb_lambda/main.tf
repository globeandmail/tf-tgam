resource "aws_lb" "lb" {
  name               = "${var.name}"
  internal           = "${var.internal}"
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.subnets}"]

  enable_deletion_protection = "${var.enable_deletion_protection}"

  tags = "${var.tags}"
}

resource "aws_lb_target_group" "lambda" {
  name        = "lambda-${var.name}"
  target_type = "lambda"

  tags = "${var.tags}"
}

resource "aws_lb_target_group_attachment" "lambda" {
  target_group_arn = "${aws_lb_target_group.lambda.arn}"
  target_id        = "${var.function_arn}"
}

resource "aws_lb_listener" "HTTP" {
  // Create the HTTP listener if http_server = true
  count             = "${var.http_server ==  1 ? 1 : 0 }"
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.lambda.arn}"
  }
}

resource "aws_lb_listener" "HTTPS" {
  // Create the HTTPS listener if https_server = true
  count             = "${var.https_server == 1 ? 1 : 0 }"
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "${var.ssl_policy}"
  certificate_arn   = "${var.certificate_arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.lambda.arn}"
  }
}

resource "aws_lambda_permission" "alb" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_arn}"
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = "${aws_lb_target_group.lambda.arn}"
}
