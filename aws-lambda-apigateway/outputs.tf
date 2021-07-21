# Output value definitions

output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."
  value = aws_s3_bucket.lambda_bucket.id
}

output "base_url" {
  description = "API Function URL"
  value = aws_api_gateway_deployment.example.invoke_url
}

output "function_name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.example.function_name
}

output "certificate_dns" {
  description = "Domain validation information to add to S3"
  value = var.enable_certificate ? aws_acm_certificate.cert[0].domain_validation_options : ""
}