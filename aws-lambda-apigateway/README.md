# AWS • Lambda function call using API gateway 
This `terraform` example creates a lambda function and makes that lambda function accessible through a REST endpoint via API gateway. 

## Requirements
* `terraform >= 1.0.2`

## Setup
* Run `terraform init`
* Run `terraform plan` - review the changes to be introduced
* Run `terraform apply`

## Verifying the function 
Run `terraform output` and observe the outputs. It will show the `base_url` an `function_name`. 

* Browse to the url in `base_url`, this should return **Hello world!**
* If you have `awscli` installed, you can invoke the function using the following command 
  * `aws lambda invoke --region=eu-central-1 --function-name=$function_name output.txt`
  * You should have a `output.txt` file with **Hello world!** in it.


## Destroy created resources 
* Run `terraform destroy` 

## References
* [Hashicorp Tutorial - Terraform Lambda API Gateway]https://learn.hashicorp.com/tutorials/terraform/lambda-api-gateway