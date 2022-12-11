# --------------------------
# Terraform Configuration
# --------------------------
terraform {
  required_version = ">= 1.3.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# --------------------------
# Provider
# --------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}
provider "aws" {
  alias   = "virginia"
  profile = "terraform"
  region  = "us-east-1"
}

# --------------------------
# variables
# --------------------------
variable "project" {
  type    = string
  default = "tasting-note"
}
variable "db_password" {
  type = string
}
