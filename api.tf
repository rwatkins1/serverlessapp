resource "aws_api_gateway_rest_api" "student_data" {
  name        = "student_data"
}

resource "aws_api_gateway_method" "GET" {
  rest_api_id   = aws_api_gateway_rest_api.student_data.id
  resource_id   = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "POST" {
  rest_api_id   = aws_api_gateway_rest_api.student_data.id
  resource_id   = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "OPTIONS" {
  rest_api_id   = aws_api_gateway_rest_api.student_data.id
  resource_id   = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "GetIntegration" {
  rest_api_id          = aws_api_gateway_rest_api.student_data.id
  resource_id          = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method          = aws_api_gateway_method.GET.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri = aws_lambda_function.getData.invoke_arn
  content_handling = "CONVERT_TO_TEXT"
}

resource "aws_api_gateway_integration" "OptionsIntegration" {
  rest_api_id          = aws_api_gateway_rest_api.student_data.id
  resource_id          = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method          = aws_api_gateway_method.OPTIONS.http_method
  type = "MOCK"
  request_templates = {
    "application/json" = jsonencode({ statusCode = 200 })
  }
}

resource "aws_api_gateway_integration" "PostIntegration" {
  rest_api_id          = aws_api_gateway_rest_api.student_data.id
  resource_id          = aws_api_gateway_rest_api.student_data.root_resource_id
  http_method          = aws_api_gateway_method.POST.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri = aws_lambda_function.putStudent.invoke_arn
  content_handling = "CONVERT_TO_TEXT"

}