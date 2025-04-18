output "jenkins_master_role_arn" {
  value = aws_iam_role.jenkins_master_role.arn
  description = "ARN of Jenkins Master IAM Role"
}

output "jenkins_agent_role_arn" {
  value = aws_iam_role.jenkins_agent_role.arn
  description = "ARN of Jenkins Agent IAM Role"
}

output "jenkins_master_policy_arn" {
  value = aws_iam_policy.jenkins_master_policy.arn
  description = "ARN of Jenkins Master IAM Policy"
}

output "jenkins_agent_policy_arn" {
  value = aws_iam_policy.jenkins_agent_policy.arn
  description = "ARN of Jenkins Agent IAM Policy"
}

output "jenkins_master_instance_profile" {
  value = aws_iam_instance_profile.jenkins_master_profile.name
  description = "Name of Jenkins Master IAM Instance Profile"
}

output "jenkins_agent_instance_profile" {
  value = aws_iam_instance_profile.jenkins_agent_profile.name
  description = "Name of Jenkins Agent IAM Instance Profile"
}
