resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = "acw-AutoStop"
  description         = "Event rule to exec AutoStop lambda"
  schedule_expression = "${var.schedule_expression}"
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule = "${aws_cloudwatch_event_rule.event_rule.name}"
  arn  = "${aws_lambda_function.lambda.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.event_rule.arn}"
}
