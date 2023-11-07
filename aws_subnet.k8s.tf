# File: aws_subnet.k8s.tf

# subnets
resource "aws_subnet" "k8s" {
  for_each = {for subnet in var.k8s_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id
  cidr_block = "${each.value.cidr_block}"
  availability_zone = "${each.value.availability_zone}"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (k8s)"
      Terraform_resource = "aws_subnet.k8s"
    }
  )
}

# Return k8s subnets for this vpc
data "aws_subnets" "k8s" {
  filter {
    name = "vpc-id"
    values = [aws_vpc.product.id]
  }

  tags = {
    Terraform_resource = "aws_subnet.k8s"
  }
}

# EOF: aws_subnet.k8s.tf
