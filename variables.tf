variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name tag of the VPC"
  default     = "jenkins-on-demand"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {
    Project = "jenkins"
    Env     = "dev"
  }
}
variable "public_subnet_cidr" {
  type = string  
}

variable "private_subnet_cidr" {
  type = string  
}

variable "availability_zone" {
  type = string
}
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
variable "subnet_name" {
  type = string
}
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}
variable "project" {
  type = string
}