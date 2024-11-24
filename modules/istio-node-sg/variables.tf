variable "vpc_id" {
  description = "The VPC ID to associate the security group with"
  type        = string
}

variable "services" {
  description = "List of services requiring VPC endpoint security groups (for VPCE-specific modules)"
  type        = list(string)
  default     = []
}

variable "referenced_sg_ids" {
  description = "Map of SG IDs to reference for inter-component communication"
  type        = map(string)
  default     = {}
}
