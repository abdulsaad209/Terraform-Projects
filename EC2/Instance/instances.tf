# Create a key pair
resource "aws_key_pair" "tf_key" {
  key_name   = var.portfolio-key-name
  public_key = file("${path.module}/${var.portfolio-key-name}.pub")
}

# Create a security group to allow inbound traffic on specified ports
module "portfolio_sg" {
  source = "./modules/security-group"

  name           = var.name
  description    = var.description
  vpc_id         = var.vpc_id
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  tags           = var.tags
}

resource "aws_instance" "portfolio" {
 ami                    = var.ubuntu-ami
 instance_type          = var.portfolio-instance-type
 key_name               = var.portfolio-key-name
 vpc_security_group_ids = [module.portfolio_sg.security_group_id]
 tags = {
   Name = "portfolio-instance-${count.index + 1}"
 }
 count = var.portfolio_instance_count
 depends_on = [aws_key_pair.tf_key, module.portfolio_sg.security_group_id]
}

