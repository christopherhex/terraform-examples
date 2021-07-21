
# Define the archive file that will contain our lambda function code
data "archive_file" "lambda_example" {
  type = "zip"

  source_dir  = "${path.module}/example"
  output_path = "${path.module}/example.zip"
}

resource "aws_s3_bucket_object" "lambda_example" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "example.zip"
  source = data.archive_file.lambda_example.output_path

  etag = filemd5(data.archive_file.lambda_example.output_path)
}

resource "aws_lambda_function" "example" {
   function_name = "ServerlessExample"

   s3_bucket = aws_s3_bucket.lambda_bucket.id
   s3_key    = aws_s3_bucket_object.lambda_example.key

   # "main" is the filename within the zip file (main.js) and "handler"
   # is the name of the property under which the handler function was
   # exported in that file.
   handler = "main.handler"
   runtime = "nodejs10.x"

   role = aws_iam_role.lambda_exec.arn
}

 # IAM role which dictates what other AWS services the Lambda function
 # may access.
resource "aws_iam_role" "lambda_exec" {
   name = "serverless_example_lambda"

   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}