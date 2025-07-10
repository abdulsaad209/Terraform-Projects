# Create security group for RDS
module "rds_sg" {
  source = "./modules/security-group"

  name           = var.rds_sg_name
  description    = var.rds_sg_description
  vpc_id         = module.portfolio_vpc.vpc_id
  ingress_rules  = {}
  egress_rules   = var.egress_rules
  tags           = var.rds_tags
}

# Create SG rule and attach to RDS SG
resource "aws_security_group_rule" "rds_ingress_from_app" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.rds_sg.security_group_id
  source_security_group_id = module.portfolio_sg.security_group_id
  description              = "Allow MySQL access from app SG"
}

# Create RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.app_name}-rds-subnet-group"
  subnet_ids = module.portfolio_vpc.private_subnet_ids

  tags = {
      Name = "${var.app_name}-rds-subnet-group"
      }
}

# Create RDS Parameter Group
resource "aws_db_parameter_group" "rds_parameter_group" {
  name        = "${var.app_name}-rds-parameter-group"
  family      = "mariadb10.11"
  description = "RDS parameter group for MariaDB"

  tags = {
      Name = "${var.app_name}-rds-parameter-group"
      }
}

# Create RDS Instance
resource "aws_db_instance" "portfolio-db" {
  identifier              = "${var.app_name}-rds-instance"
  engine                  = "mariadb"
  engine_version          = "10.11"
  instance_class          = var.rds_instance_type
  allocated_storage       = var.rds_allocated_storage
  storage_type            = "gp2"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [module.rds_sg.security_group_id]
  parameter_group_name    = aws_db_parameter_group.rds_parameter_group.name
  username                = var.rds_username
  password                = var.rds_password
  skip_final_snapshot     = true
  publicly_accessible     = false # Set to false for security
  multi_az                = false # Set to false for cost efficiency in dev environments
  backup_retention_period = 2

  tags = {
      Name = "${var.app_name}-rds-instance"
      }
}

