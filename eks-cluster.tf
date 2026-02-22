resource "aws_eks_cluster" "this" {
  name     = "${var.project}-eks"
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = concat(
      aws_subnet.public[*].id,
      aws_subnet.private[*].id
    )
  }
}
