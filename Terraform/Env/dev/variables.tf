variable "vpc_id" {
  description = "ID of the VPC in the dev environment"
  type        = string
  default     = "vpc-03e3bf2aaf3fe30c4"
}

variable "subnet_ids" {
  description = "List of subnet IDs in the dev environment"
  type        = list(string)
  default     = ["subnet-0ea02e84b9af1a72e", "subnet-07fbf65fd6374656e","subnet-0a7039f1650197687"]
}

# variable "control_plane_subnet_ids" {
#   description = "List of subnet IDs for the EKS control plane in the dev environment"
#   type        = list(string)
#   default     = ["your_dev_control_plane_subnet_id_here"]
# }
