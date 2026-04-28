# Terraform AWS Infrastructure

3-tier AWS infrastructure using Terraform with modular architecture.

## What gets created
- VPC with public and private subnets
- Internet Gateway + Route Tables  
- EC2 instance (Flask app server)
- Security Groups (SSH, HTTP, Flask port)

## Architecture
- S3 remote backend + DynamoDB state locking
- Modular structure: modules/vpc, modules/ec2, modules/security-groups
- Environment support: dev.tfvars / prod.tfvars

## Commands
terraform apply -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"

## Author
Vivek Sharma | github.com/viveksharma9900
# Updated
