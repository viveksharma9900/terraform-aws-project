variable "aws_region" {
  description = "AWS region jahan infra banana hai"
  type        = string
  default     = "ap-south-1"
  validation {
    condition     = contains(["ap-south-1","us-east-1","us-west-2"], var.aws_region)
    error_message = "Sirf ap-south-1, us-east-1, ya us-west-2 allowed hai."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
  validation {
    condition     = can(regex("^t3\\.", var.instance_type))
    error_message = "Sirf t3 family allowed hai — t3.micro, t3.small, t3.medium."
  }
}

variable "project_name" {
  description = "Project naam — sab resources ke tags mein jayega"
  type        = string
  default     = "flaskapp"
  validation {
    condition     = length(var.project_name) >= 3 && length(var.project_name) <= 20
    error_message = "Project naam 3 se 20 characters ke beech hona chahiye."
  }
}

variable "environment" {
  description = "Environment — dev, staging, ya prod"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev","staging","prod"], var.environment)
    error_message = "Environment sirf dev, staging, ya prod ho sakta hai."
  }
}

variable "db_password" {
  description = "Database password — kabhi hardcode mat karo"
  type        = string
  sensitive   = true
  default     = "TempPass123!"
}
