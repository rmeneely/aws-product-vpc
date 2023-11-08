# File: aws_eip.product.tf

# Elastic IPs for NAT gateways
resource "aws_eip" "product" {
  for_each = {for subnet in var.public_subnets: subnet.cidr_block => subnet}
  vpc = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} ${each.value.cidr_block} ${each.value.availability_zone} (public)"
      Terraform_resource = "aws_eip.product"
    }
  )
}

# EOF: aws_eip.product.tf
