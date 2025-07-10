# Create security group for RDS
module "rds_sg" {
  source = "./modules/security-group"

  name           = var.rds_sg_name
  description    = var.rds_sg_description
  vpc_id         = module.portfolio_vpc.vpc_id
  ingress_rules  = var.rds_ingress_rules
  egress_rules   = var.egress_rules
  tags           = var.rds_tags
}

