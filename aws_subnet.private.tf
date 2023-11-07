# File: aws_subnet.private.tf

# subnets
resource "aws_subnet" "private" {
  for_each = {for subnet in var.private_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id
  cidr_block = "${each.value.cidr_block}"
  availability_zone = "${each.value.availability_zone}"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (private)"
      Terraform_resource = "aws_subnet.private"
    }
  )
}

# Return private subnets for this vpc
data "aws_subnets" "private" {
  filter {
    name = "vpc-id"
    values = [aws_vpc.product.id]
  }

  tags = {
    Terraform_resource = "aws_subnet.private"
  }
}

# EOF: aws_subnet.private.tf
