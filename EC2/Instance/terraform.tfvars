# Instance Details
ubuntu-ami = "ami-0a7d80731ae1b2435"
portfolio-key-name = "tf_key"

# Provider Details
aws-region = "us-east-1"

# Security Group Configuration
# This security group allows specific inbound traffic and all outbound traffic
name        = "portfolio_allow_tls"
description = "Allow specific inbound traffic and all outbound traffic"
vpc_id      = "vpc-0aaf2ccd625479db5"

ingress_rules = {
  "port_22" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }
  "port_80" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }
  "port_443" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS access from anywhere"
  }
}

tags = {
  Name        = "portfolio_allow_tls"
  Environment = "dev"
}

egress_rules = {
  "only_something" = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All outbound traffic on all ports"
  }
}

