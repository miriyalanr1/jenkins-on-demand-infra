module "vpc" {
  source = "./modules/vpc"

  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
  tags           = var.tags
}

module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id  # Replace with your VPC module output
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.availability_zone  # Replace with your desired availability zone
  name                = var.subnet_name
}

module "network" {
  source            = "./modules/network"
  vpc_id            = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr_block
  public_subnet_id  = module.subnet.public_subnet_id   # or loop later for multiple
  private_subnet_id = module.subnet.private_subnet_id  # if only one for now
  availability_zones = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project = var.project
}