module "ec2_private" {
  source = "./terraform_EC2"
}

module "ec2_public" {
  source = "./terraform_EC2"
}

module "private_sg" {
  source = "./terraform_SG"
}

module "public_bastion_sg" {
  source = "./terraform_SG"
}

module "vpc" {
  source = "./terraform_VPC"
}