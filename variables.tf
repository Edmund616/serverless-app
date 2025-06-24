variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "partition_key" {
  description = "DynamoDB partition key"
  type        = string
}


