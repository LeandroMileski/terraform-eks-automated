module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "21.19.0"

    name               = var.cluster_name
    kubernetes_version = "1.33"

    endpoint_public_access = true
    enable_cluster_creator_admin_permissions = true
    enable_irsa = true

    compute_config = {
        enabled    = true
        node_pools = ["general-purpose"]
    }

    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    addons = {
        coredns = {}
        eks-pod-identity-agent = {
            before_compute = true
        }
        kube-proxy = {}
        vpc-cni = {
            before_compute = true
        }
    }

    eks_managed_node_groups = {
        dev = {
            instance_types   = [var.node_instance_type]
            ami_type         = "AL2023_x86_64_STANDARD"

            desired_capacity = var.node_desired_size
            max_capacity     = var.node_max_size
            min_capacity     = var.node_min_size
        }
    }

    tags = {
        Environment = "dev"
        Terraform   = "true"
        Application = "${var.application.name}"

    }
}

