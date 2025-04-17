variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "tags" {
  description = "Common tags for the VPC"
  type        = map(string)
  default     = {}
}
