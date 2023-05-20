module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "17.1.0"

    cluster_name    = "my-eks-cluster"
    cluster_version = "1.26"
    vpc_id          = module.vpc.vpc_id
    subnets         = module.vpc.private_subnets

    node_groups = {
        eks_nodes = {
            desired_capacity = 2
            max_capacity     = 2
            min_capacity     = 1

            instance_type = "t3.medium"
            key_name       = "eks_key" # Update this with your AWS key pair name.

            root_volume_size = "20"
            root_volume_type = "gp2"

            name_prefix = "worker-group-1"
        }
    }
}