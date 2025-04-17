resource "aws_vpc" "on_demand" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"

  tags = merge(
    var.tags,
    {
      Name = var.vpc_name
    }
  )
}