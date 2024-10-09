# infra/outputs.tf

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_oidc_issuer_url" {
  description = "The OIDC issuer URL for the EKS cluster"
  value       = module.eks.cluster_oidc_issuer_url
}

output "cluster_oidc_provider_arn" {
  description = "The ARN of the OIDC provider associated with the EKS cluster"
  value       = module.eks.oidc_provider_arn
}

output "vpc_id" {
  description = "The VPC ID where the EKS cluster is deployed"
  value       = module.vpc.vpc_id
}

output "alb_controller_role_arn" {
  description = "ARN of the AWS Load Balancer Controller IAM Role"
  value       = aws_iam_role.alb_controller_role.arn
}

output "alb_controller_policy_arn" {
  description = "ARN of the AWS Load Balancer Controller IAM Policy"
  value       = aws_iam_policy.alb_controller_policy.arn
}