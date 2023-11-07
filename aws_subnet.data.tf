# File: aws_subnet.data.tf

# subnets
resource "aws_subnet" "data" {
  for_each = {for subnet in var.data_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id
  cidr_block = "${each.value.cidr_block}"
  availability_zone = "${each.value.availability_zone}"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (data)"
      Terraform_resource = "aws_subnet.data"
    }
  )
}

# Return data subnets for this vpc
data "aws_subnets" "data" {
  filter {
    name = "vpc-id"
    values = [aws_vpc.product.id]
  }

  tags = {
    Terraform_resource = "aws_subnet.data"
  }
}

# EOF: aws_subnet.data.tf
