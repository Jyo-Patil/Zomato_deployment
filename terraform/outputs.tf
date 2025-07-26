# output "ecr_url" {
#   value = aws_ecr_repository.netflix.repository_url
# }

output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "ecr_url" {
  value = aws_ecrpublic_repository.netflix.repository_uri
}
