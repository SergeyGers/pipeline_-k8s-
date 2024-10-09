# eks.tf

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = var.name
  cluster_endpoint_public_access = true

  enable_irsa = true  # Enable IAM Roles for Service Accounts

  cluster_addons = {
    coredns    = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni    = { most_recent = true }
  }


  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = var.instance_types

    attach_cluster_primary_security_group = false
  }

  eks_managed_node_groups = {
    ascode-cluster-wg = {
      min_size     = 2
      max_size     = 4
      desired_size = 3

      instance_types = var.instance_types
      capacity_type  = "ON_DEMAND"

      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  tags = local.tags

}
