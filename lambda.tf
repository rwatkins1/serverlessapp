resource "aws_lambda_function" "putStudent" {
  function_name = "putStudent"
  role          = data.aws_iam_role.lambda_dynamodb_role.arn
  runtime       = "python3.11"
  handler       = "putData.lambda_handler"  # Specify the correct handler function
  filename      = "/Users/rennardwatkins/microservice/putData.zip"  # Path to your local zip file
}

resource "aws_lambda_function" "getData" {
  function_name = "getData"
  role          = data.aws_iam_role.lambda_dynamodb_role.arn
  runtime       = "python3.11"
  handler       = "getData.lambda_handler"  # Specify the correct handler function
  filename      = "/Users/rennardwatkins/microservice/getData.zip"  # Path to your local zip file
}