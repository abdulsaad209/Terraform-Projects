#output "PUBLIC_IP_OF_WINDOWS_SERVER" {
#  value = aws_instance.windows-test-instance.public_ip
#}
#
#

output "PUBLIC_IP_OF_UBUNTU_SERVER" {
  value = aws_instance.webserver.public_ip
}

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