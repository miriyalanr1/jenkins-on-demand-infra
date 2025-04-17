variable "vpc_id" {
  description = "The VPC ID to create subnets within."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "az" {
  description = "The availability zone for the subnets."
  type        = string
}

variable "name" {
  description = "Name prefix for the subnets."
  type        = string
}
