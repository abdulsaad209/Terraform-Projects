# Create security group for RDS
module "rds_sg" {
  source = "./modules/security-group"

  name           = var.rds_sg_name
  description    = var.rds_sg_description
  vpc_id         = module.portfolio_vpc.vpc_id
  ingress_rules  = {
    "mariadb" = {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      source_security_group_id = module.portfolio_sg.security_group_id
      description = "Allow MySQL access from the portfolio security group"
    }
  }
  egress_rules   = var.egress_rules
  tags           = var.rds_tags
}

