variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

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
  default     = 1
}