# File: aws_route_table.k8s.tf

# route_tables
resource "aws_route_table" "k8s" {
  for_each = {for subnet in var.k8s_subnets: subnet.cidr_block => subnet}

  vpc_id = aws_vpc.product.id

  route { # Internet
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.availability_zone["${each.value.availability_zone}"].id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.availability_zone} (k8s)"
      Terraform_resource = "aws_route_table.k8s"
    }
  )

  lifecycle {
    ignore_changes = [route]
  }
}

# EOF: aws_route_table.k8s.tf
