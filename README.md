# Terraform AWS Infrastructure

Production-ready 3-tier AWS infrastructure using Terraform.

## Architecture

Internet → ALB → EC2 (Public Subnet) → RDS (Private Subnet)

↑
Auto Scaling Group

## Modules

| Module | Description |
|--------|-------------|
| `modules/vpc` | VPC, subnets, IGW, route tables |
| `modules/ec2` | Application server |
| `modules/security-groups` | Firewall rules |

## Features

- S3 remote backend + DynamoDB state locking
- GitHub Actions CI — auto terraform plan on every push
- Dev/Prod environment support via tfvars

## Commands

```bash
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"
```

## Tech Stack

`AWS` `Terraform` `Docker` `Kubernetes` `Jenkins` `Prometheus` `Grafana`

## Author

Vivek Sharma | [GitHub](https://github.com/viveksharma9900)
