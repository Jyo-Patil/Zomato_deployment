resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_eks_cluster" "eks" {
  name     = "netflix-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = aws_subnet.public[*].id
  }
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "netflix-nodes"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn
  subnet_ids      = aws_subnet.public[*].id
  instance_types  = ["t3.micro"]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}