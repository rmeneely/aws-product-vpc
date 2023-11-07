# File: aws_nat_gateway.public.tf

# NAT gateways for each public subnet availability zone
resource "aws_nat_gateway" "availability_zone" {
  for_each = {for subnet in var.public_subnets: subnet.availability_zone => subnet}
  allocation_id = aws_eip.product["${each.value.cidr_block}"].id
  subnet_id =  aws_subnet.public["${each.value.cidr_block}"].id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (public)"
      Terraform_resource = "aws_nat_gateway.availability.zone"
      Availability_Zone = "${each.value.availability_zone}"
    }
  )
  depends_on = [aws_internet_gateway.product]
}

# EOF: aws_nat_gateway.public.tf
