resource "aws_ecr_repository" "netflix" {
  name = "netflix-clone"
}

resource "aws_ecrpublic_repository" "netflix" {
  repository_name = "netflix-clone"

  catalog_data {
    description = "Public ECR repo for the Netflix Clone project"
  }
}