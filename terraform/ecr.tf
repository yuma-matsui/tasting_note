# resource "aws_ecr_repository" "tasting_note" {
#   name = var.project
# }

# resource "aws_ecr_lifecycle_policy" "tasting_note" {
#   repository = aws_ecr_repository.tasting_note.name
#   policy     = file("./policies/ecr_lifecycle_policy.json")
# }
