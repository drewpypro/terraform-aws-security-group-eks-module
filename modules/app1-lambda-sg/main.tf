resource "aws_security_group" "app1_lambda" {
  description = "Security group"
  vpc_id      = var.vpc_id
}

output "app1_lambda_sg_id" {
  value = aws_security_group.app1_lambda.id
}

resource "aws_vpc_security_group_ingress_rule" "app1_lambda_ingress_rule1" {
  security_group_id = aws_security_group.app1_lambda.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "4.224.0.0/12"
}


resource "aws_vpc_security_group_ingress_rule" "app1_lambda_ingress_rule2" {
  security_group_id            = aws_security_group.app1_lambda.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  referenced_security_group_id = lookup(var.referenced_sg_ids, "worker_node", null)
}

resource "aws_vpc_security_group_egress_rule" "app1_lambda_egress_rule1" {
  security_group_id = aws_security_group.app1_lambda.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

