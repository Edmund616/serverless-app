variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "partition_key" {
  description = "Partition key (primary key) for the table"
  type        = string
}


resource "aws_dynamodb_table" "file_metadata" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"    # On-demand capacity for automatic scaling
  hash_key     = "file_key"

  attribute {
    name = "file_key"
    type = "S"
  }
}

output "file_metadata_table_name" {
  value = aws_dynamodb_table.file_metadata.name
}

