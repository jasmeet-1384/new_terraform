terraform {
  backend "remote" {
    organization = "hashicrop-learn-jass"
    workspaces {
      name = "new_terraform"
    }
  }

  required_version = "~>1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

     null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }  
  }
}

provider "aws" {
  region = var.aws_region
}
