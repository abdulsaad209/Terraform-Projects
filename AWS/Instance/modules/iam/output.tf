output "role_name" {
  description = "The IAM role name"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.this.arn
}
