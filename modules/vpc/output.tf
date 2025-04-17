output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.on_demand.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.on_demand.cidr_block
}
