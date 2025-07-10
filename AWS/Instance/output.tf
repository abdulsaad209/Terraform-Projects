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

output "portfolio_sg_ingress_rules" {
  description = "RDS instance details"
  value = {
    db_endpoint = aws_db_instance.portfolio-db.endpoint
  }
}

output "Public_IP" {
  description = "Public IP of the EC2 instance"
  value       = {
    public_ip = aws_instance.portfolio-public.public_ip
  }
}

output "Private_IP" {
  description = "Private IP of the EC2 instance"
  value       = {
    portfolio-private-ip-1 = aws_instance.portfolio-private.private_ip[0]
    portfolio-private-ip-2 = aws_instance.portfolio-private.private_ip[1]
  }
}
