variable "region" {
  default = "ap-south-1"
}

variable "project" {
  default = "tf-practice"
}

variable "environment" {
  default = "basic-eks-dev"
}

variable "vpc_cidr" {
  default = "172.22.0.0/16"
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
  default = ["172.22.1.0/24", "172.22.2.0/24"]
}

variable "private_subnets" {
  default = ["172.22.101.0/24", "172.22.102.0/24"]
}
