variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "ubuntu-ami" {
    type = string
}

variable "windows-ami" {
  default = "ami-08ded310ca86fa861"
}

variable "ubuntu-instance-type" {
  type = string
}

variable "ubuntu-key-name" {
  type = string
}

variable "aws-region" {
  type = string
}

variable "ports" {
  description = "Map of ports to allowed CIDRs"
  type = map(list(string))
  default = {
    10050  = ["10.99.5.204/32"]
    33322  = ["10.0.0.0/16"]
  }
}

variable "portfolio_instance_count" {
  type    = number
  default = 1
  
}

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
