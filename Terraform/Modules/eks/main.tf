# variable "cluster_name" {
#   description = "Name of the EKS cluster"
#   default     = null
# }

locals {
  cluster_name_prompt = var.cluster_name != null ? {} : {
    prompt = {
      type = "text"
      description = "Enter the name for the EKS cluster:"
    }
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name != null ? var.cluster_name : "default-cluster-name"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  # control_plane_subnet_ids = var.control_plane_subnet_ids

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
    Environment = var.environment
    Terraform   = "true"
  }
}
