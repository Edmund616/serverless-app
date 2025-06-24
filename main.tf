provider "aws" {
  region = var.region
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  lambda_arn  = module.lambda.lambda_arn  # <- this must be correct
}


module "dynamodb" {
  source        = "./modules/dynamodb"
  table_name    = var.table_name
  partition_key = var.partition_key
}

module "lambda" {
  source         = "./modules/lambda"
  bucket_arn     = module.s3.upload_bucket_arn
  dynamodb_table = var.table_name
}

