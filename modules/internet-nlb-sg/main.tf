resource "aws_security_group" "internet_nlb" {
  description = "Security group"
  vpc_id      = var.vpc_id
}

output "security_groups" {
  value = {
    internet_nlb = aws_security_group.internet_nlb.id
  }
}

resource "aws_vpc_security_group_ingress_rule" "internet_nlb_ingress_rule1" {
  security_group_id = aws_security_group.internet_nlb.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "4.224.0.0/12"
}


resource "aws_vpc_security_group_ingress_rule" "internet_nlb_ingress_rule2" {
  security_group_id            = aws_security_group.internet_nlb.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  referenced_security_group_id = lookup(var.referenced_sg_ids, "worker_node", null)
}

resource "aws_vpc_security_group_egress_rule" "internet_nlb_egress_rule1" {
  security_group_id = aws_security_group.internet_nlb.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

