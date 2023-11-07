# File: aws_route_table_association.k8s.tf

# route_tables
resource "aws_route_table_association" "k8s" {
  for_each = {for subnet in var.k8s_subnets: subnet.cidr_block => subnet}

  subnet_id = aws_subnet.k8s["${each.value.cidr_block}"].id
  route_table_id = aws_route_table.k8s["${each.value.cidr_block}"].id

}

# EOF: aws_route_table_association.k8s.tf
