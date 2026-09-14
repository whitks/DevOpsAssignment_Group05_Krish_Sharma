variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "Availability zones for the subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_type" {
  description = "EC2 instance type for the app server"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  sensitive   = true
}

variable "admin_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into the server (office/VPN IPs)"
  type        = list(string)
  default     = ["103.21.58.0/24"]
}