#output "PUBLIC_IP_OF_WINDOWS_SERVER" {
#  value = aws_instance.windows-test-instance.public_ip
#}
#
#

# output "PUBLIC_IP_OF_UBUNTU_SERVER" {
#   value = aws_instance.webserver.public_ip
# }

output "key-name" {
  value = aws_key_pair.tf_key.key_name
}

output "portfolio_sg_id" {
  description = "ID of the portfolio security group"
  value       = module.portfolio_sg.security_group_id
}

output "portfolio_sg_arn" {
  description = "ARN of the portfolio security group"
  value       = module.portfolio_sg.security_group_arn
}

output "rds" {
  description = "RDS instance details"
  value = {
    db_instance_identifier = aws_db_instance.portfolio-db.id
    db_instance_class      = aws_db_instance.portfolio-db.instance_class
    db_engine              = aws_db_instance.portfolio-db.engine
    db_endpoint            = aws_db_instance.portfolio-db.endpoint
    db_port                = aws_db_instance.portfolio-db.port
    db_username            = aws_db_instance.portfolio-db.username
  }
}