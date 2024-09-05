resource "aws_cloudwatch_event_rule" "console" {
  name        = "lambda_test"
  description = "111"
  schedule_expression = "cron(0 19 ? * TUE *)"

}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "SendToLambda"
  arn       = aws_lambda_function.my_lambda.arn

}

/*resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.console.arn
}*/