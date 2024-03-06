terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35"
    }
  }

  backend "s3" {
    region = "ap-south-1"
    key    = "eks.tfstate" 
    bucket = "shubham-test-cluster-bucket"
  }
}

provider "aws" {
  region      = "ap-south-1"
  max_retries = 5 
}

module "eks" {
  source                   = "./Modules/eks"
  cluster_name             = var.cluster_name
  environment              = var.environment
  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  # control_plane_subnet_ids = var.control_plane_subnet_ids
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "environment" {
  description = "Name of the current environment (e.g., dev, qa, prod)"
  type        = string
  default     = "dev"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS nodes"
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "List of subnet IDs for the EKS control plane"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC for EKS"
  type        = string
}
