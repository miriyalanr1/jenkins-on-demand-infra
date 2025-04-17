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

