# Jenkins On-Demand Infrastructure

This Terraform configuration creates on-demand Jenkins master and agent EC2 instances in AWS. The infrastructure includes:
- VPC, subnets, and security groups
- EC2 instances (Jenkins Master and Agent)
- IAM roles for EC2 instances

## Prerequisites
- Terraform 1.x
- AWS CLI configured with access credentials
- SSH key pair for access to the EC2 instances

## Usage

1. Clone the repository:
    ```bash
    git clone <repo-url>
    cd jenkins-on-demand-infra
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Create a `terraform.tfvars` file to specify values for the required variables:
    ```bash
    key_name = "your-key-name"
    subnet_id = "subnet-id"
    vpc_id = "vpc-id"
    ```

4. Apply the configuration:
    ```bash
    terraform apply
    ```

5. Access Jenkins via the public IP of the Jenkins Master EC2 instance.
