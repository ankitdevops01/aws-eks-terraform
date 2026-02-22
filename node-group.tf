resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.project}-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.private[*].id

  instance_types = ["t3.micro"]
  ami_type       = "AL2023_x86_64_STANDARD"

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  capacity_type = "ON_DEMAND"

  labels = {
    role = "worker"
    env  = var.environment
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.project}-eks-node"
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_readonly_policy
  ]
}
