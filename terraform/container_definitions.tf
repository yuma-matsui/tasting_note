data "template_file" "container_definitions" {
  template = file("./task_definitions/rails_container_definitions.json")

  vars = {
    project               = var.project
    image                 = aws_ecr_repository.tasting_note.repository_url
    aws_ssm_parameter_arn = data.aws_ssm_parameter.rails_master_key.arn
  }
}
