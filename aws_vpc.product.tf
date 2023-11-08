# File: aws_vpc.product.tf

# Create a VPC
resource "aws_vpc" "product" {
  cidr_block = var.vpc.cidr_block
  tags = merge(
    var.common_tags,
    {
      Name = var.vpc.name
      Terraform_resource = "aws_vpc.product"
    }
  )
}

# EOF: aws_vpc.product.tf
