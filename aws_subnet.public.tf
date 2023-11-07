# File: aws_subnet.public.tf

# subnets
resource "aws_subnet" "public" {
  for_each = {for subnet in var.public_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id
  cidr_block = "${each.value.cidr_block}"
  availability_zone = "${each.value.availability_zone}"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (public)"
      Terraform_resource = "aws_subnet.public"
    }
  )
}

# Return public subnets for this vpc
data "aws_subnets" "public" {
  filter {
    name = "vpc-id"
    values = [aws_vpc.product.id]
  }

  tags = {
    Terraform_resource = "aws_subnet.public"
  }
}

# EOF: aws_subnet.public.tf
