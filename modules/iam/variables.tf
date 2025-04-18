variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name prefix for naming"
  type        = string
}

variable "jenkins_master_role_name" {
  description = "The name of the IAM role for Jenkins master"
  type        = string
}

variable "jenkins_agent_role_name" {
  description = "The name of the IAM role for Jenkins agents"
  type        = string
}

variable "jenkins_master_policy_name" {
  description = "The name of the IAM policy for Jenkins master"
  type        = string
}

variable "jenkins_agent_policy_name" {
  description = "The name of the IAM policy for Jenkins agent"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Jenkins EC2 instances will be deployed"
  type        = string
}

variable "iam_role_assume_policy" {
  description = "The assume role policy for EC2 instance"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
