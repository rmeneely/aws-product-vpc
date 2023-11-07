# File: backend.tf

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "organization_name"

    workspaces {
      prefix = "product-vpc-"
    }
  }
}

# EOF backend.tf
