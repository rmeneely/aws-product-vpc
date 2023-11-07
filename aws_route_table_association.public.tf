# File: aws_route_table_association.public.tf

# route_tables
resource "aws_route_table_association" "public" {
  for_each = {for subnet in var.public_subnets: subnet.cidr_block => subnet}

  subnet_id = aws_subnet.public["${each.value.cidr_block}"].id
  route_table_id = aws_route_table.public["${each.value.cidr_block}"].id

}

# EOF: aws_route_table_association.public.tf
