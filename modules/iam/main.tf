provider "aws" {
  region = var.region
}

# Define IAM role for Jenkins Master EC2
resource "aws_iam_role" "jenkins_master_role" {
  name               = var.jenkins_master_role_name
  assume_role_policy = data.aws_iam_policy_document.jenkins_assume_role_policy.json
}

# IAM Policy Document for Assume Role Policy
data "aws_iam_policy_document" "jenkins_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Define IAM policy for Jenkins Master EC2
resource "aws_iam_policy" "jenkins_master_policy" {
  name        = var.jenkins_master_policy_name
  description = "Policy for Jenkins master to manage EC2 agents"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeRegions"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "ssm:DescribeInstanceInformation",
          "ssm:SendCommand",
          "ssm:StartSession",
          "ssm:TerminateSession"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "jenkins_master_policy_attachment" {
  policy_arn = aws_iam_policy.jenkins_master_policy.arn
  role       = aws_iam_role.jenkins_master_role.name
}

# Define IAM instance profile for Jenkins Master EC2
resource "aws_iam_instance_profile" "jenkins_master_profile" {
  name = "jenkins-master-profile"
  role = aws_iam_role.jenkins_master_role.name
}

# Define IAM role for Jenkins Agent EC2
resource "aws_iam_role" "jenkins_agent_role" {
  name               = var.jenkins_agent_role_name
  assume_role_policy = data.aws_iam_policy_document.jenkins_assume_role_policy.json
}

# Define IAM policy for Jenkins Agent EC2
resource "aws_iam_policy" "jenkins_agent_policy" {
  name        = var.jenkins_agent_policy_name
  description = "Policy for Jenkins agent to allow SSM connections"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ssm:DescribeInstanceInformation",
          "ssm:SendCommand",
          "ssm:StartSession",
          "ssm:TerminateSession"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "jenkins_agent_policy_attachment" {
  policy_arn = aws_iam_policy.jenkins_agent_policy.arn
  role       = aws_iam_role.jenkins_agent_role.name
}

# Define IAM instance profile for Jenkins Agent EC2
resource "aws_iam_instance_profile" "jenkins_agent_profile" {
  name = "jenkins-agent-profile"
  role = aws_iam_role.jenkins_agent_role.name
}

# Define IAM role for EC2 Instances
resource "aws_iam_role" "ec2_instance_role" {
  name               = "ec2-instance-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

# Policy Document for EC2 Instance Role (basic EC2 permissions)
data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
