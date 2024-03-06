variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-03e3bf2aaf3fe30c4"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-0ea02e84b9af1a72e", "subnet-07fbf65fd6374656e","subnet-0a7039f1650197687"]
}

# variable "control_plane_subnet_ids" {
#   description = "List of subnet IDs for the EKS control plane"
#   type        = list(string)
#   default     = ["your_default_control_plane_subnet_id_here"]
# }

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "your_default_cluster_name_here"
}

variable "environment" {
  description = "Environment (e.g., dev, qa, prod)"
  type        = string
  default     = "dev"
}

locals {
  unique_cluster_name_prompt = var.cluster_name == "" ? { prompts = ["Enter the name for the EKS cluster:"] } : {}
}
