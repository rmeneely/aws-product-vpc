# File: aws_route_table_association.private.tf

# route_tables
resource "aws_route_table_association" "private" {
  for_each = {for subnet in var.private_subnets: subnet.cidr_block => subnet}

  subnet_id = aws_subnet.private["${each.value.cidr_block}"].id
  route_table_id = aws_route_table.private["${each.value.cidr_block}"].id

}

# EOF: aws_route_table_association.private.tf
