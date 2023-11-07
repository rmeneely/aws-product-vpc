# File: aws_route_table.public.tf

# route_tables
resource "aws_route_table" "public" {
  for_each = {for subnet in var.public_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id

  route { # Internet
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.product.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.availability_zone} (public)"
      Terraform_resource = "aws_route_table.public"
    }
  )

  lifecycle {
    ignore_changes = [route]
  }
}

# EOF: aws_route_table.public.tf
