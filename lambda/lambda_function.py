import boto3
import os
import logging
from datetime import datetime

# Initialize DynamoDB resource
dynamodb = boto3.resource('dynamodb')

# Get table name from environment variable
table_name = os.environ['DYNAMODB_TABLE']
table = dynamodb.Table(table_name)

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    try:
        # Get the S3 bucket and object info from the event
        record = event['Records'][0]['s3']
        bucket = record['bucket']['name']
        key = record['object']['key']
        size = record['object'].get('size', 0)  # may be missing for some events
        timestamp = datetime.utcnow().isoformat()

        # Prepare the metadata item
        item = {
            'file_key': key,
            'bucket': bucket,
            'size': size,
            'timestamp': timestamp
        }

        # Write metadata to DynamoDB
        table.put_item(Item=item)

        logger.info(f"Metadata saved to DynamoDB: {item}")
        return {
            "statusCode": 200,
            "body": "Metadata saved successfully"
        }

    except Exception as e:
        logger.error(f"Error processing S3 event: {str(e)}")
        raise e

