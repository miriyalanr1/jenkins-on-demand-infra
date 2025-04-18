vpc_name        = "jenkins-on-demand"
vpc_cidr_block  = "10.0.0.0/16"
tags = {
  Project = "JenkinsOnDemand"
  Owner   = "Nageswara"
  Environment = "dev"
  Project     = "jenkins"
}
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone = "us-east-1a"
subnet_name = "jenkins-on-demand"
availability_zones  = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
project = "JenkinsOnDemand"

jenkins-master-role   = "jenkins-master-role"
jenkins-agent-role    = "jenkins-agent-role"
jenkins-master-policy = "jenkins-master-policy"
jenkins-agent-policy  = "jenkins-agent-policy"