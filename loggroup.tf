/*resource "aws_cloudwatch_log_group" "my_log_group" {
  name = "/aws/lambda/my-lambda-function"
  retention_in_days = 14 
}

resource "aws_cloudwatch_metric_alarm" "error_alarm" {
  alarm_name                 = "LambdaErrorAlarm"
  comparison_operator        = "GreaterThanOrEqualToThreshold"
  evaluation_periods         = "1"
  metric_name                = "Error"
  namespace                  = "MyLambda"
  period                     = "300"
  statistic                  = "Sum"
  threshold                  = "1"
  alarm_description          = "Alarm when the Lambda function errors occur"
 

  dimensions = {
    FunctionName = "my-lambda-function"
  }
}*/

resource "aws_cloudwatch_log_metric_filter" "error_alarm" {
  name           = "LambdaError"
  pattern        = "ERROR"
  log_group_name = aws_cloudwatch_log_group.my_log_group.name

  metric_transformation {
    name      = "LambdaErrors"
    namespace = "Lambda"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_group" "my_log_group" {
  name = "/aws/lambda/my-lambda-function"
  retention_in_days = 14 
}