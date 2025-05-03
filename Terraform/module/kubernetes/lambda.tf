data "aws_caller_identity" "current" {}

data "aws_api_gateway_rest_api" "mckingapi_api" {
  name = "mckingapi-api"
}

data "aws_api_gateway_resource" "mckingapi_resource" {
  rest_api_id = data.aws_api_gateway_rest_api.mckingapi_api.id
  path        = "/mckingapi"
}

resource "null_resource" "download_lambda_zip" {
  provisioner "local-exec" {
    command = "curl -L -o ${path.module}/lambda_function.zip https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-lambda-Fase3/releases/download/latest/lambda_function.zip"
  }
}

resource "aws_lambda_function" "mckingapi_lambda" {
  filename      = "${path.module}/lambda_function.zip"
  function_name = "CPFValidation"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  role          = data.aws_iam_role.mcking_role.arn
  timeout       = 30

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [var.security_group_id]
  }

  environment {
    variables = {
      USER_POOLID = data.aws_cognito_user_pool.mcking_user_pool.id
      API_URL     = "http://${kubernetes_service.mckingapi_service.status[0].load_balancer[0].ingress[0].hostname}/api/Clientes/filtrar"
    }
  }

  depends_on = [null_resource.download_lambda_zip]
}

resource "aws_lambda_permission" "allow_apigateway_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.mckingapi_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:us-east-1:${data.aws_caller_identity.current.account_id}:${data.aws_api_gateway_rest_api.mckingapi_api.id}/*"
}

resource "aws_api_gateway_integration" "mckingapi_lambda_integration" {
  rest_api_id             = data.aws_api_gateway_rest_api.mckingapi_api.id
  resource_id             = data.aws_api_gateway_resource.mckingapi_resource.id
  http_method             = "ANY"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.mckingapi_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "mckingapi_deployment" {
  rest_api_id = data.aws_api_gateway_rest_api.mckingapi_api.id

  depends_on = [
    aws_api_gateway_integration.mckingapi_lambda_integration
  ]
}

resource "aws_api_gateway_stage" "mckingapi_stage" {
  rest_api_id   = data.aws_api_gateway_rest_api.mckingapi_api.id
  stage_name    = "prod"
  deployment_id = aws_api_gateway_deployment.mckingapi_deployment.id
}