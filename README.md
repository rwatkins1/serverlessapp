![Screen Shot 2024-08-21 at 1 49 30 PM](https://github.com/user-attachments/assets/063e2dad-4ad1-4b34-9220-e7f61ac0a495)

Serverless Web Application
A serverless web application using AWS services and Terraform for infrastructure as code.
Architecture

Frontend: S3-hosted static form
API Layer: API Gateway + Lambda functions
Database: DynamoDB
IaC: Terraform

Prerequisites

AWS CLI configured with appropriate permissions
Terraform v1.0+

AWS Resources

S3 Bucket: Hosts static website content
API Gateway: Manages API endpoints
Lambda: Processes form submissions
DynamoDB: Stores form data
IAM: Manages service permissions

Monitoring

CloudWatch Logs: Lambda function logs
CloudWatch Metrics: API Gateway metrics
DynamoDB throughput monitoring

Cleanup
Remove all resources: 

terraform destroy
