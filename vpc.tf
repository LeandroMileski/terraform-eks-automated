provider "aws" {
    region = var.region
}

variable vpc_cidr_block {}
variable private-subnets{}
variable public-subnets{}
variable azs {}

data "aws_availability_zones" "available" {}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "myapp-vpc"
    cidr = var.vpc_cidr_block

    azs             = data.aws_availability_zones.available.names
    private_subnets = var.private-subnets
    public_subnets  = var.public-subnets

    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true

    # Required tags for EKS subnet auto-discovery
    public_subnet_tags = {
        "kubernetes.io/role/elb" = 1
    }
    private_subnet_tags = {
        "kubernetes.io/role/internal-elb" = 1
    }

    tags = {        
        Terraform = "true"
        Environment = "dev"
    }
}

