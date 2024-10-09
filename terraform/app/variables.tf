# app/variables.tf

variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"  # Replace with your desired default region
}
