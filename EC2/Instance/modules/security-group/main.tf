resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  # Ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    iterator = rule
    content {
      from_port   = rule.value.from_port
      to_port     = rule.value.to_port
      protocol    = rule.value.protocol
      cidr_blocks = rule.value.cidr_blocks
      description = rule.value.description
    }
  }

  # Egress rules (optional)
  dynamic "egress" {
    for_each = var.egress_rules
    iterator = rule
    content {
      from_port   = rule.value.from_port
      to_port     = rule.value.to_port
      protocol    = rule.value.protocol
      cidr_blocks = rule.value.cidr_blocks
      description = rule.value.description
    }
  }

  tags = var.tags
}
