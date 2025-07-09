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

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}

