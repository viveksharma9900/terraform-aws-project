terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket         = "vivek-terraform-state-1777200705"
    key            = "flaskapp/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" { region = var.aws_region }

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  project_name        = var.project_name
  environment         = var.environment
}

module "security_groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.vpc.public_subnet_id
  sg_id         = module.security_groups.ec2_sg_id
  instance_type = var.instance_type
  project_name  = var.project_name
  environment   = var.environment
}

output "server_ip" { value = module.ec2.instance_public_ip }
output "vpc_id"    { value = module.vpc.vpc_id }
