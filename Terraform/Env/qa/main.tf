terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35"
    }
  }

  # Use local backend for storing state file for QA environment
  backend "local" {
    path = "path/to/qa/eks.tfstate"
  }
}

provider "aws" {
  region      = "ap-south-1"
  max_retries = 5 
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

module "eks" {
  source  = "../../modules/eks"

  cluster_name    = var.cluster_name != "" ? var.cluster_name : null
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  eks_managed_node_group_defaults = {
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    eks_nodegroup_blue = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
    eks_nodegroup_green = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "qa"
    Terraform   = "true"
  }
}
