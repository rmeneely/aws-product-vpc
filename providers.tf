## File: providers.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key

  default_tags {
    tags = {
      Component = "VPC"
      Managed_by = "terraform"
      Product = "product"
      Resource_group = local.resource_group
      Repository = "aws-product-vpc"
      Team = "team_name"
    }
  }
}

# EOF: providers.tf
