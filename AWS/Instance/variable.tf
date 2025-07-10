variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.4.0/24"]
}

variable "app_name" {
  description = "Name of the Application"
  type        = string
  default     = "portfolio"
}

# AMI Variables
variable "ubuntu-ami" {
    type = string
}

variable "portfolio-key-name" {
  type = string
}

variable "aws-region" {
  type = string
}

# Security Group Variables
variable "name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "Map of ingress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "Map of egress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = {
    "all_outbound" = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  }
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}

# Instance variables
variable "portfolio-instance-type" {
  description = "Instance type for the Ubuntu server"
  type        = string
  default     = "t2.micro"
}

variable "portfolio_instance_count" {
  description = "Number of portfolio instances to create"
  type        = number
  default     = 2
}

# RDS Variables
variable "rds_sg_name" {
  description = "Name of the RDS security group"
  type        = string
  default     = "rds-security-group"
  
}
variable "rds_sg_description" {
  description = "Description of the RDS security group"
  type        = string
  default     = "Security group for RDS instances"
}

variable "rds_ingress_rules" {
  description = "Map of ingress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "rds_tags" {
  description = "Tags for the RDS security group"
  type        = map(string)
  default     = {
    Name = "rds-security-group"
  }
}
