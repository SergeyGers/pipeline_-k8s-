# variables.tf

variable "name" {
  description = "Name of the project and EKS cluster"
  type        = string
  default     = "my_project"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.10.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.3.0/24", "10.10.4.0/24"]
}

variable "intra_subnets" {
  description = "Intra subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.5.0/24", "10.10.6.0/24"]
}

variable "instance_types" {
  description = "EC2 instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Example = "my_project"
  }
}
