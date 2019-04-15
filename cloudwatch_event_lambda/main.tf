resource "aws_cloudwatch_event_rule" "rule" {
  name                = "${var.function_name}"
  schedule_expression = "${var.schedule_expression}"

  tags = "${var.tags}"
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = "${aws_cloudwatch_event_rule.rule.name}"
  target_id = "${var.function_name}"
  arn       = "${var.function_arn}"
}

resource "aws_lambda_permission" "cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.rule.arn}"
}
