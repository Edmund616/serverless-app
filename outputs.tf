output "s3_bucket_name" {
  value = module.s3.upload_bucket_name
}

output "s3_bucket_arn" {
  value = module.s3.upload_bucket_arn
}


output "dynamodb_table_name" {
  value = module.dynamodb.file_metadata_table_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.lambda_arn
}




