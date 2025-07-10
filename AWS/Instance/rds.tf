# Create security group for RDS
module "rds_sg" {
  source = "./modules/security-group"

  name           = var.name
  description    = var.description
  vpc_id         = module.portfolio_vpc.vpc_id
  ingress_rules  = {}
  egress_rules   = var.egress_rules
  tags           = var.tags
}

resource "aws_security_group_rule" "rds_ingress_from_app" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.rds_sg.security_group_id
  source_security_group_id = module.portfolio_sg.security_group_id
  description              = "Allow MySQL access from app SG"
}