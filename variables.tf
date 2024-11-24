variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "services" {
  description = "List of services requiring VPC endpoint security groups"
  type        = list(string)
}

variable "referenced_sg_ids" {
  description = "Map of referenced SG IDs for inter-service communication"
  type        = map(string)
  default     = {}
}
