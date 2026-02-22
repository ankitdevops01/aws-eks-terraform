terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    bucket  = "my-terraform-config-state"
    key     = "aws-eks/basic-eks-setup-22022026.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      project_name = "eks-launch-by-terraform"
      environment  = "dev"
    }
  }
}