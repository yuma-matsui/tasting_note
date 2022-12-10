# --------------------------
# Subnet Group
# --------------------------
resource "aws_db_subnet_group" "postgres" {
  name = "${var.project}-postgres-subnetgroup"
  subnet_ids = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1c.id,
    aws_subnet.private_1d.id
  ]

  tags = {
    Name = "${var.project}-postgres-subnetgroup"
  }
}
# --------------------------
# RDS instance
# --------------------------
resource "aws_db_instance" "postgres" {
  engine         = "postgres"
  engine_version = "14.5"

  identifier = "${var.project}-postgres"
  username   = "postgres"
  password   = var.db_password

  instance_class = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 500
  storage_type          = "gp2"
  storage_encrypted     = false

  multi_az               = false
  availability_zone      = "ap-northeast-1a"
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false
  port                   = 5432

  db_name              = "tasting_note_postgres"
  parameter_group_name = "default.postgres14"
  option_group_name    = "default:postgres-14"

  backup_window              = "04:00-05:00"
  backup_retention_period    = 7
  maintenance_window         = "Mon:05:00-Mon:08:00"
  auto_minor_version_upgrade = false

  performance_insights_enabled = true
  deletion_protection          = true
  skip_final_snapshot          = false

  apply_immediately = true

  tags = {
    Name = "${var.project}-postgres"
  }
}
