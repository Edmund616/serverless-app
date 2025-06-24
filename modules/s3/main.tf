variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  type        = string
}

variable "lambda_arn" {
  description = "Lambda ARN to trigger on S3 events"
  type        = string
}



resource "aws_s3_bucket" "upload_bucket" {
  bucket = "edmonton-serverless-logs-325e9f"
}

resource "aws_s3_bucket_notification" "s3_lambda_notify" {
  bucket = aws_s3_bucket.upload_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_s3_bucket.upload_bucket, var.lambda_arn]
}


output "upload_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.upload_bucket.bucket
}

output "upload_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.upload_bucket.arn
}







