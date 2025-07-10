# Create a key pair
resource "aws_key_pair" "tf_key" {
  key_name   = var.portfolio-key-name
  public_key = file("${path.module}/${var.portfolio-key-name}.pub")
}

# Create a VPC
module "portfolio_vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  app_name         = var.app_name
}

# Create a security group to allow inbound traffic on specified ports
module "portfolio_sg" {
  source = "./modules/security-group"

  name           = var.name
  description    = var.description
  vpc_id         = module.portfolio_vpc.vpc_id
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  tags           = var.tags
}

# Define local block 
locals {
  instance_configs = {
    "public_instance" = {
      subnet_id = module.portfolio_vpc.public_subnet_ids[0]
    }
    "private_instance_1" = {
      subnet_id = module.portfolio_vpc.private_subnet_ids[0]
    }
    "private_instance_2" = {
      subnet_id = module.portfolio_vpc.private_subnet_ids[1]
    }
  }
}

# Create EC2 instances
resource "aws_instance" "portfolio" {
  for_each                = local.instance_configs
  ami                     = var.ubuntu-ami
  instance_type           = var.portfolio-instance-type
  key_name                = var.portfolio-key-name
  vpc_security_group_ids  = [module.portfolio_sg.security_group_id]
  subnet_id               = each.value.subnet_id

  tags = {
    Name = "portfolio-${each.key}"
  }

  depends_on = [aws_key_pair.tf_key, module.portfolio_sg]
}

