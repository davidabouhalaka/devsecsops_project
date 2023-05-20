module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "17.1.0"

    cluster_name    = "my-eks-cluster"
    cluster_version = "1.20"
    subnets         = module.vpc.private_subnets

    node_groups = {
        eks_nodes = {
            desired_capacity = 2
            max_capacity     = 2
            min_capacity     = 1

            instance_typle = "t3.medium"
            key_name       = "my-key-name" # Update this with your AWS key pair name.

            root_volume_size = "20"
            root_volume_type = "gp2"

            name_prefix = "worker-group-1"
        }
    }
}