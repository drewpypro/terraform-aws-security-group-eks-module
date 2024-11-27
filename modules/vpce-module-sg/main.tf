locals {
  flatmap = flatten([
    for service in var.services : [
      for sg_id in var.referenced_sg_ids : {
        service_name = service
        sg_id        = sg_id
      }
    ]
  ])
}


resource "aws_security_group" "vpc_endpoint_sg" {
  for_each    = toset(var.services)
  name        = "${each.key}-vpce-sg"
  vpc_id      = var.vpc_id
  description = "Security group for VPC endpoint ${each.key}"
}

output "security_groups" {
  description = "Map of service names to security group IDs"
  value       = { for key, sg in aws_security_group.vpc_endpoint_sg : key => sg.id }
}


resource "aws_vpc_security_group_ingress_rule" "allow_referenced_sg" {
  for_each = { for idx, rule in local.flatmap : idx => rule }

  security_group_id            = aws_security_group.vpc_endpoint_sg[each.value.service_name].id
  referenced_security_group_id = each.value.sg_id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

