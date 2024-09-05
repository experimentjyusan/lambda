resource "aws_lambda_function" "my_lambda" {
  function_name    = "my-lambda-function"
  architectures    = ["x86_64"]
  filename         = "lambda_function_payload.zip"  
  handler          = "index.handler"  
  runtime          = "nodejs20.x" 
  role             = aws_iam_role.lambda_execution_role.arn  
  source_code_hash = filebase64sha256("lambda_function_payload.zip")  
  tags = {
    Environment = "Test"
    Name        = "Lambda"
  }
}