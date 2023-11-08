# File: aws_internet_gateway.product.tf

# internet_gateway
resource "aws_internet_gateway" "product" {
  vpc_id = aws_vpc.product.id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.vpc.name}"
      Terraform_resource = "aws_internet_gateway.product"
    }
  )
}

# EOF: aws_internet_gateway.product.tf
