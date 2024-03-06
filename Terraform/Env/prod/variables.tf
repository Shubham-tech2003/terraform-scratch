variable "vpc_id" {
  description = "ID of the VPC in the dev environment"
  type        = string
  default     = "your_prod_vpc_id_here"
}

variable "subnet_ids" {
  description = "List of subnet IDs in the dev environment"
  type        = list(string)
  default     = ["your_prod_subnet_id_1_here", "your_prod_subnet_id_2_here"]
}

variable "control_plane_subnet_ids" {
  description = "List of subnet IDs for the EKS control plane in the dev environment"
  type        = list(string)
  default     = ["your_prod_control_plane_subnet_id_here"]
}
