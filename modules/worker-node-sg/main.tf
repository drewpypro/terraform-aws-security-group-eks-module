resource "aws_security_group" "worker_node" {
  description = "Security group"
  vpc_id      = var.vpc_id
}

output "security_groups" {
  value = {
    worker_node = aws_security_group.worker_node.id
  }
}

resource "aws_vpc_security_group_ingress_rule" "worker_node_ingress_rule1" {
  security_group_id = aws_security_group.worker_node.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "4.224.0.0/12"
}


resource "aws_vpc_security_group_ingress_rule" "worker_node_ingress_rule2" {
  security_group_id            = aws_security_group.worker_node.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  referenced_security_group_id = lookup(var.referenced_sg_ids, "istio_node", null)
}

resource "aws_vpc_security_group_egress_rule" "worker_node_egress_rule1" {
  security_group_id = aws_security_group.worker_node.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

