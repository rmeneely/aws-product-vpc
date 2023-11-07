# File: aws_route_table_association.data.tf

# route_tables
resource "aws_route_table_association" "data" {
  for_each = {for subnet in var.data_subnets: subnet.cidr_block => subnet}

  subnet_id = aws_subnet.data["${each.value.cidr_block}"].id
  route_table_id = aws_route_table.data["${each.value.cidr_block}"].id

}

# EOF: aws_route_table_association.data.tf
