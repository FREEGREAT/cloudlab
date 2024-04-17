resource "aws_api_gateway_rest_api" "this" {

name = module.label_api.id
description = "API Gateway"

endpoint_configuration {
  types = [ "REGIONAL" ]
}
}

resource "aws_api_gateway_resource" "courses" {
   rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id = aws_api_gateway_rest_api.this. root_resource_id
  path_part = "courses"
}

resource "aws_api_gateway_method" "courses_option" {
   rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource. courses. id
  http_method = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "courses_post" {
   rest_api_id = aws_api_gateway_rest_api. this.id
   resource_id = aws_api_gateway_resource. courses.id
  http_method = "POST"
  authorization = "NONE"
  request_validator_id = aws_api_gateway_request_validator.this.id
#   request_models = {
#     "application/json" = replace("${module.label_api.id}-PostCourse", "-", "")
#   }
}

resource "aws_api_gateway_request_validator" "this" {
  name                          = "validate_request_body"
   rest_api_id                  = aws_api_gateway_rest_api.this.id
  validate_request_body         = true
}

resource "aws_api_gateway_integration" "courses_integration" {
  rest_api_id = aws_api_gateway_rest_api. this.id
  resource_id = aws_api_gateway_resource. courses.id
  http_method = aws_api_gateway_method. courses_option.http_method
  type = "MOCK"
  request_templates = {
    "application/json" = <<PARAMS
  "statusCode": 200 }
PARAMS
    }
}

resource "aws_api_gateway_integration" "get_courses" {
  rest_api_id                   = aws_api_gateway_rest_api.this.id
  resource_id                   = aws_api_gateway_resource.courses.id
  http_method                   = aws_api_gateway_method.courses_post.http_method
  integration_http_method       = "POST"
  type                          = "AWS"
  uri                           = module.lambdas.lambda_courses_invoke_arn
  request_parameters            = {"integration.request.header.X-Authorization" = "'static'"}
  request_templates             = {
 "application/xml" = <<EOF
    {
            "body" : $input.json('$')
    }
    EOF
    }
  content_handling = "CONVERT_TO_TEXT"
}