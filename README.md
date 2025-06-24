# 🖇️ Serverless File Upload Processor (S3 → Lambda → DynamoDB)

This is a serverless application built using **AWS Lambda**, **Amazon S3**, and **Amazon DynamoDB**, fully provisioned via **Terraform**. It demonstrates how to build a scalable, event-driven pipeline that responds to file uploads in S3 by triggering a Lambda function to store metadata into a DynamoDB table.

---

## Features

- ✅ **S3 Event Trigger**: File uploads to an S3 bucket trigger a Lambda function.
- ✅ **Lambda Processing**: The function extracts basic metadata and stores it in DynamoDB.
- ✅ **DynamoDB Storage**: Durable, low-latency storage for file information.
- ✅ **Terraform IaC**: All infrastructure defined and managed with Terraform.
- ✅ **Stateless & Scalable**: Fully serverless, auto-scaling, and event-driven.
- ✅ **CloudWatch Logging**: All errors and logs routed to AWS CloudWatch for observability.

---

 Architecture

```text
User Uploads File → S3 Bucket → Lambda Triggered → DynamoDB Entry Created
