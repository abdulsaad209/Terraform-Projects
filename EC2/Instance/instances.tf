# Create a key pair
resource "aws_key_pair" "tf_key" {
  key_name   = var.portfolio-key-name
  public_key = file("${path.module}/${var.portfolio-key-name}.pub")
}

# Create a VPC
module "vpc" {
  source = "modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  cluster_name         = var.app_name
}

# Create a security group to allow inbound traffic on specified ports
module "portfolio_sg" {
  source = "./modules/security-group"

  name           = var.name
  description    = var.description
  vpc_id         = module.vpc.vpc_id
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  tags           = var.tags
}

resource "aws_instance" "portfolio" {
 ami                    = var.ubuntu-ami
 instance_type          = var.portfolio-instance-type
 key_name               = var.portfolio-key-name
 vpc_security_group_ids = [module.portfolio_sg.security_group_id]
 tags = {
   Name = "portfolio-instance-${count.index + 1}"
 }
 count = var.portfolio_instance_count
 depends_on = [aws_key_pair.tf_key, module.portfolio_sg.security_group_id]
}

