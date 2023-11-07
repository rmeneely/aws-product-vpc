# File: private_route_table.private.tf

# route_tables
resource "aws_route_table" "private" {
  for_each = {for subnet in var.private_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id

  route { # Internet
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id =  aws_nat_gateway.availability_zone["${each.value.availability_zone}"].id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.availability_zone} (private)"
      Terraform_resource = "aws_route_table.private"
    }
  )

  lifecycle {
    ignore_changes = [route]
  }
}

# EOF: aws_route_table.private.tf
